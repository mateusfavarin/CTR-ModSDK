#pragma once

#include <cstring>
#include <stdint.h>

#define RESET_ARR(arr) memset(&arr[0], 0, sizeof(arr))

static constexpr size_t ADDR_OCTR	 = 0x8000C000;
static constexpr size_t ADDR_gGT	 = 0x80096b20;
static constexpr size_t ADDR_GAMEPAD = 0x80096804;
static constexpr size_t ADDR_CHEATS	 = 0x80096b28;

enum Buttons
{
	BTN_UP		   = 0x1,
	BTN_DOWN	   = 0x2,
	BTN_LEFT	   = 0x4,
	BTN_RIGHT	   = 0x8,
	BTN_CROSS_one  = 0x10,
	BTN_CROSS_two  = 0x4000,
	BTN_CROSS	   = BTN_CROSS_one | BTN_CROSS_two,
	BTN_SQUARE_one = 0x20,
	BTN_SQUARE_two = 0x8000,
	BTN_SQUARE	   = BTN_SQUARE_one | BTN_SQUARE_two,
	BTN_CIRCLE	   = 0x40,
	BTN_L2_one	   = 0x80,
	BTN_L2_two	   = 0x100,
	BTN_L2		   = BTN_L2_one | BTN_L2_two,
	BTN_R2		   = 0x200,
	BTN_R1		   = 0x400,
	BTN_L1		   = 0x800,
	BTN_START	   = 0x1000,
	BTN_SELECT	   = 0x2000,
	BTN_L3		   = 0x10000,
	BTN_R3		   = 0x20000,
	BTN_TRIANGLE   = 0x40000
};

enum Cheats
{
	CHEAT_WUMPA		 = 0x200,
	CHEAT_MASK		 = 0x400,
	CHEAT_TURBO		 = 0x800,
	CHEAT_INVISIBLE	 = 0x8000,
	CHEAT_ENGINE	 = 0x10000,
	CHEAT_ADV		 = 0x40000,
	CHEAT_ICY		 = 0x80000,
	CHEAT_TURBOPAD   = 0x100000,
	CHEAT_SUPERHARD  = 0x200000,
	CHEAT_BOMBS		 = 0x400000,
	CHEAT_ONELAP	 = 0x800000,
	CHEAT_TURBOCOUNT = 0x8000000,
	CHEAT_ALL		 = CHEAT_WUMPA | CHEAT_MASK | CHEAT_TURBO | CHEAT_INVISIBLE | CHEAT_ENGINE | CHEAT_ADV | CHEAT_ICY | CHEAT_TURBOPAD | CHEAT_SUPERHARD | CHEAT_BOMBS | CHEAT_ONELAP | CHEAT_TURBOCOUNT
};

struct Gamepad
{
	uint16_t unk_0;
	uint16_t unk_1;
	uint16_t stickLX;
	uint16_t stickLY;
	uint16_t stickLX_dontUse1;
	uint16_t stickLY_dontUse1;
	uint16_t stickRX;
	uint16_t stickRY;
	uint32_t buttonsHeldCurrFrame;
	uint32_t buttonsTapped;
	uint32_t buttonsReleased;
	uint32_t buttonsHeldPrevFrame;
	uint8_t filler[0x30];
};

class PSX
{
public:
	inline void SetRam(uint8_t* ram) { m_ram = ram; };
	template<typename T> inline T& Read(size_t addr)
	{
		return *reinterpret_cast<T*>(&m_ram[addr & 0xFFFFFF]);
	};

private:
	uint8_t* m_ram = nullptr;
};

extern PSX g_psx;