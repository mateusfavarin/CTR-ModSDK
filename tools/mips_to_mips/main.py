import rabbitizer
import os

PSX_RAM_BASE = 0x80010000

def get_decompiled_funcs(path: str):
    symbols = {}
    with open(path, "r") as file:
        for line in file:
            line = [l.strip() for l in line.split()]
            if "DECOMP_" not in line[1]:
                continue
            addr = int("0x" + line[0], 16)
            if addr >= PSX_RAM_BASE:
                    addr -= PSX_RAM_BASE
            symbol = line[1][7:]
            symbols[symbol] = addr
    return symbols

def read_symbols(path: str, begin: int, end: int):
    symbols = {}
    symbols_all = {}
    sorted_addr = []
    if begin >= PSX_RAM_BASE:
        begin -= PSX_RAM_BASE
    if end >= PSX_RAM_BASE:
        end -= PSX_RAM_BASE
    with open(path, "r") as file:
        for line in file:
            line = [l.strip() for l in line.split("=") if l.strip() != '']
            if len(line) == 0:
                continue
            if len(line) == 2:
                symbol = line[0]
                addr = int(line[1][:-1], 0)
                if addr >= PSX_RAM_BASE:
                    addr -= PSX_RAM_BASE
                symbols_all[addr] = symbol
                if addr <= begin or addr >= end:
                    continue
                symbols[addr] = symbol
                sorted_addr.append(addr)
    sorted_addr.append(end)
    sorted_addr.sort()
    return symbols, sorted_addr, symbols_all

def to_le(be: int):
    return ((be & 0xFF) << 24) + (((be >> 8) & 0xFF) << 16) + (((be >> 16) & 0xFF) << 8) + ((be >> 24) & 0xFF)

buffer = bytearray()
with open("SCUS_944.26", "rb") as file:
    buffer = file.read()[0x800:]

rabbitizer.config.toolchainTweaks_treatJAsUnconditionalBranch = True
rabbitizer.config.misc_expandJalr = True
rabbitizer.config.misc_opcodeLJust = 1

symbols, sorted_addr, symbols_all = read_symbols("gcc-syms926.txt", 0x800100cc, 0x8007170c)
decomp_funcs = get_decompiled_funcs("redux.map")

for i in range(len(sorted_addr) - 1):
    func_start = sorted_addr[i]
    func_end = sorted_addr[i + 1]
    func = buffer[func_start : func_end]
    func_name = symbols[func_start]
    if func_name in decomp_funcs:
        continue

    labels = {}
    sorted_labels = []
    lbl_count = 0
    for i in range(0, len(func), 4):
        bytecode = (func[i]) + (func[i + 1] << 8) + (func[i + 2] << 16) + (func[i + 3] << 24 )
        addr = func_start + PSX_RAM_BASE + i
        inst = rabbitizer.Instruction(bytecode, addr, rabbitizer.InstrCategory.R3000GTE)
        if not inst.isFunctionCall() and inst.isJumpWithAddress():
            jump_addr = inst.getBranchVramGeneric()
            lbl_name = "lbl_" + func_name + "_" + str(lbl_count)
            if jump_addr in symbols_all:
                lbl_name = decomp_funcs[jump_addr]
                if lbl_name in decomp_funcs:
                    lbl_name = "DECOMP_" + lbl_name
                sorted_labels.append(lbl_name)
                continue
            labels[jump_addr] = lbl_name
            sorted_labels.append(lbl_name)
            lbl_count += 1

    jal_errors = {}
    jmp_id = 0
    warning_func_ptr = False
    function = ".set noreorder\n.align 2\n.global " + func_name + "\n.type " + func_name + ", @function\n\n" + func_name + ":\n"
    for i in range(0, len(func), 4):
        bytecode = (func[i]) + (func[i + 1] << 8) + (func[i + 2] << 16) + (func[i + 3] << 24 )
        addr = func_start + PSX_RAM_BASE + i
        inst = rabbitizer.Instruction(bytecode, addr, rabbitizer.InstrCategory.R3000GTE)
        if addr in labels:
            function += labels[addr] + ":\n"
            labels.pop(addr)
        disassembled = False
        if inst.isFunctionCall():
            if inst.isJumpWithAddress():
                func_addr = inst.getBranchVramGeneric() - PSX_RAM_BASE
                jal_name = str()
                if func_addr in symbols_all:
                    jal_name = symbols_all[func_addr]
                    if jal_name in decomp_funcs:
                        jal_name = "DECOMP_" + jal_name
                    function += "\t" + inst.disassemble(jal_name) + "\n"
                else:
                    function += "\t" + inst.disassemble("ERROR") + "\n"
                    jal_addr = inst.getBranchVramGeneric()
                    if jal_addr not in jal_errors:
                        jal_errors[jal_addr] = True
                        print("ERROR: Function does not exist: " + str(hex(jal_addr)))
                disassembled = True
            else:
                warning_func_ptr = True
        elif inst.isJumpWithAddress():
            function += "\t" + inst.disassemble(sorted_labels[jmp_id]) + "\n"
            jmp_id += 1
            disassembled = True
        if not disassembled:
            function += "\t.word " + hex(inst.getRaw()) + "\n"
    if len(labels) > 0:
        print("ERROR: missing labels in " + func_name)
    if warning_func_ptr:
        print("WARNING: " + func_name + " contains function pointer calls")
    with open("src/" + func_name + ".s", "w") as file:
        file.write(function)
