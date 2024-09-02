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

RELEASE_CXXFLAGS := -O3
DEBUG_CXXFLAGS := -g -O0

#all targets share these flags in common
COMMON_CXXFLAGS = -std=c++20 \
-DCLIENT_SERVER \
-DSIZEOF_SIZE_T=8 \
-DSIZEOF_UNSIGNED_LONG_LONG=8 \
-DXD3_MAIN=0 \
-DXD3_DEBUG=0 \
-DXD3_USE_LARGEFILE64=1 \
-DREGRESSION_TEST=0 \
-DSECONDARY_DJW=1 \
-DSECONDARY_FGK=1 \
-DSECONDARY_LZMA=0 \
-DXD3_POSIX=1 \
-DEXTERNAL_COMPRESSION=0 \
-DSHELL_TESTS=0 \
$(LIBS) \
-Isrc \
-I../../decompile/General/AltMods \
-I/usr/include/SDL2 \
-I../../externals/imgui \
-I../../externals/json/include \
-I../../externals/portable-file-dialogs \
-I../../externals/cpp-httplib \
-I../../externals/CRCpp/inc \
-I../../externals/enet/include \
-I../../externals/xdelta/xdelta3/

LIBS_DYNAMIC = -Wl,-Bdynamic \
-lGL \
-lssl \
-lcrypto \
-lSDL2main \
-lSDL2 \
-lSDL2_image \
-lzip

LIBS_STATIC = -Wl,-Bstatic \
-lSDL2_image \
-lpng \
-ljpeg \
-ltiff \
-lwebp \
-lzstd \
-ljbig \
-lzip \
-ldeflate \
-Wl,-Bdynamic \
-lGL \
-lssl \
-lcrypto \
-lSDL2main \
-lSDL2 \
-lz \
-llzma

#NOTE!!!

#DO NOT ATTEMPT TO MAKE ANY TARGETS THAT RUN A "LIBS_STATIC" & "LIBS_DYNAMIC" IN A SINGLE MAKE INVOC

#directly from https://www.gnu.org/software/make/manual/html_node/Target_002dspecific.html
#Be aware that a given prerequisite will only be built once per invocation of make, 
#at most. If the same file is a prerequisite of multiple targets, and each of those 
#targets has a different value for the same target-specific variable, then the first 
#target to be built will cause that prerequisite to be built and the prerequisite will 
#inherit the target-specific value from the first target. It will ignore the 
#target-specific values from any other targets. 

duck: LIBS = $(LIBS_STATIC)
duck:
	$(CC) $(SRCS) -o $(TARGET) $(COMMON_CXXFLAGS) $(RELEASE_CXXFLAGS)

redux: LIBS = $(LIBS_STATIC)
redux:
	$(CC) $(SRCS) -o $(TARGET) $(COMMON_CXXFLAGS) $(RELEASE_CXXFLAGS) -D_DEBUG

duck-dynamic: LIBS = $(LIBS_DYNAMIC)
duck-dynamic:
	$(CC) $(SRCS) -o $(TARGET) $(COMMON_CXXFLAGS) $(RELEASE_CXXFLAGS)

redux-dynamic: LIBS = $(LIBS_DYNAMIC)
redux-dynamic:
	$(CC) $(SRCS) -o $(TARGET) $(COMMON_CXXFLAGS) $(RELEASE_CXXFLAGS) -D_DEBUG

duck-debug: LIBS = $(LIBS_DYNAMIC)
duck-debug:
	$(CC) $(SRCS) -o $(TARGET) $(COMMON_CXXFLAGS) $(DEBUG_CXXFLAGS)

redux-debug: LIBS = $(LIBS_DYNAMIC)
redux-debug:
	$(CC) $(SRCS) -o $(TARGET) $(COMMON_CXXFLAGS) $(DEBUG_CXXFLAGS) -D_DEBUG

clean:
	rm $(TARGET) || echo "Already clean!"