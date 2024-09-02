TARGET := Client
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

RELEASE_CXXFLAGS += -O3
DEBUG_CXXFLAGS += -g
DEBUG_CXXFLAGS += -O0
COMMON_CXXFLAGS += -std=c++20
COMMON_CXXFLAGS += -DCLIENT_SERVER
COMMON_CXXFLAGS += -DSIZEOF_SIZE_T=8
COMMON_CXXFLAGS += -DSIZEOF_UNSIGNED_LONG_LONG=8
COMMON_CXXFLAGS += -DXD3_MAIN=0
COMMON_CXXFLAGS += -DXD3_DEBUG=0
COMMON_CXXFLAGS += -DXD3_USE_LARGEFILE64=1
COMMON_CXXFLAGS += -DREGRESSION_TEST=0
COMMON_CXXFLAGS += -DSECONDARY_DJW=1
COMMON_CXXFLAGS += -DSECONDARY_FGK=1
COMMON_CXXFLAGS += -DSECONDARY_LZMA=0
COMMON_CXXFLAGS += -DXD3_POSIX=1
COMMON_CXXFLAGS += -DEXTERNAL_COMPRESSION=0
COMMON_CXXFLAGS += -DSHELL_TESTS=0
#CXXFLAGS += -Wl,-Bstatic
COMMON_CXXFLAGS += -lSDL2_image
COMMON_CXXFLAGS += -lpng
COMMON_CXXFLAGS += -ljpeg
COMMON_CXXFLAGS += -ltiff
COMMON_CXXFLAGS += -lwebp
COMMON_CXXFLAGS += -lzstd
COMMON_CXXFLAGS += -ljbig
COMMON_CXXFLAGS += -lzip
COMMON_CXXFLAGS += -ldeflate
#CXXFLAGS += -Wl,-Bdynamic
COMMON_CXXFLAGS += -lGL
COMMON_CXXFLAGS += -lssl
COMMON_CXXFLAGS += -lcrypto
COMMON_CXXFLAGS += -lSDL2main
COMMON_CXXFLAGS += -lSDL2
COMMON_CXXFLAGS += -lz
COMMON_CXXFLAGS += -llzma
COMMON_CXXFLAGS += -Isrc
COMMON_CXXFLAGS += -I../../decompile/General/AltMods
COMMON_CXXFLAGS += -I/usr/include/SDL2
COMMON_CXXFLAGS += -I../../externals/imgui
COMMON_CXXFLAGS += -I../../externals/json/include
COMMON_CXXFLAGS += -I../../externals/portable-file-dialogs
COMMON_CXXFLAGS += -I../../externals/cpp-httplib
COMMON_CXXFLAGS += -I../../externals/CRCpp/inc
COMMON_CXXFLAGS += -I../../externals/enet/include
COMMON_CXXFLAGS += -I../../externals/xdelta/xdelta3/

build:
	$(CC) $(SRCS) -o $(TARGET) $(COMMON_CXXFLAGS) $(RELEASE_CXXFLAGS)

debug-duck:
	$(CC) $(SRCS) -o $(TARGET) $(COMMON_CXXFLAGS) $(DEBUG_CXXFLAGS)

debug-redux:
	$(CC) $(SRCS) -o $(TARGET) $(COMMON_CXXFLAGS) $(DEBUG_CXXFLAGS) -D_DEBUG

clean:
	rm $(TARGET) || echo "Already clean!"