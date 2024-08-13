TARGET := Launcher
CC := g++

SRCS := $(wildcard src/*.cpp)
SRCS += ../../externals/imgui/imgui.cpp
SRCS += ../../externals/imgui/imgui_demo.cpp
SRCS += ../../externals/imgui/imgui_draw.cpp
SRCS += ../../externals/imgui/imgui_tables.cpp 
SRCS += ../../externals/imgui/imgui_widgets.cpp
SRCS += ../../externals/imgui/backends/imgui_impl_opengl3.cpp
SRCS += ../../externals/imgui/backends/imgui_impl_sdl2.cpp
SRCS += ../../externals/imgui/misc/cpp/imgui_stdlib.cpp
SRCS += ../../externals/enet/callbacks.c
SRCS += ../../externals/enet/compress.c
SRCS += ../../externals/enet/host.c
SRCS += ../../externals/enet/list.c
SRCS += ../../externals/enet/packet.c
SRCS += ../../externals/enet/peer.c
SRCS += ../../externals/enet/protocol.c
SRCS += ../../externals/enet/unix.c
SRCS += ../../externals/xdelta/xdelta3/xdelta3.c

CXXFLAGS += -std=c++20
CXXFLAGS += -O3
CXXFLAGS += -DCLIENT_SERVER
CXXFLAGS += -DSIZEOF_SIZE_T=8
CXXFLAGS += -DSIZEOF_UNSIGNED_LONG_LONG=8
CXXFLAGS += -DXD3_MAIN=0
CXXFLAGS += -DXD3_DEBUG=0
CXXFLAGS += -DXD3_USE_LARGEFILE64=1
CXXFLAGS += -DREGRESSION_TEST=0
CXXFLAGS += -DSECONDARY_DJW=1
CXXFLAGS += -DSECONDARY_FGK=1
CXXFLAGS += -DSECONDARY_LZMA=0
CXXFLAGS += -DXD3_POSIX=1
CXXFLAGS += -DEXTERNAL_COMPRESSION=0
CXXFLAGS += -DSHELL_TESTS=0
CXXFLAGS += -Wl,-Bstatic
CXXFLAGS += -lSDL2_image
CXXFLAGS += -lpng
CXXFLAGS += -ljpeg
CXXFLAGS += -ltiff
CXXFLAGS += -lwebp
CXXFLAGS += -lzstd
CXXFLAGS += -ljbig
CXXFLAGS += -lzip
CXXFLAGS += -ldeflate
CXXFLAGS += -Wl,-Bdynamic
CXXFLAGS += -lGL
CXXFLAGS += -lssl
CXXFLAGS += -lcrypto
CXXFLAGS += -lSDL2main
CXXFLAGS += -lSDL2
CXXFLAGS += -lz
CXXFLAGS += -llzma
CXXFLAGS += -Isrc
CXXFLAGS += -I../../decompile/General/AltMods
CXXFLAGS += -I/usr/include/SDL2
CXXFLAGS += -I../../externals/imgui
CXXFLAGS += -I../../externals/json/include
CXXFLAGS += -I../../externals/portable-file-dialogs
CXXFLAGS += -I../../externals/cpp-httplib
CXXFLAGS += -I../../externals/CRCpp/inc
CXXFLAGS += -I../../externals/enet/include
CXXFLAGS += -I../../externals/xdelta/xdelta3/

build:
	$(CC) $(SRCS) -o $(TARGET) $(CXXFLAGS)

clean:
	rm $(TARGET)