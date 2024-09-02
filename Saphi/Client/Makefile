#NOTICE: this project requires g++ 13 or later

#disable the stupid builtins
.SUFFIXES:

TARGET := Client
CC := g++

#this needs to be the first target in the file
.PHONY: all
all: duck

#========================================================
#SOURCES
#========================================================

SRCS := $(wildcard src/*.cpp) \
../../externals/imgui/imgui.cpp \
../../externals/imgui/imgui_demo.cpp \
../../externals/imgui/imgui_draw.cpp \
../../externals/imgui/imgui_tables.cpp \
../../externals/imgui/imgui_widgets.cpp \
../../externals/imgui/backends/imgui_impl_opengl3.cpp \
../../externals/imgui/backends/imgui_impl_sdl2.cpp \
../../externals/imgui/misc/cpp/imgui_stdlib.cpp \
../../externals/enet/callbacks.c \
../../externals/enet/compress.c \
../../externals/enet/host.c \
../../externals/enet/list.c \
../../externals/enet/packet.c \
../../externals/enet/peer.c \
../../externals/enet/protocol.c \
../../externals/enet/unix.c \
../../externals/xdelta/xdelta3/xdelta3.c

#intermediate object cache directory
BUILD_DIR=objs
#hashes the names to prevent name collisions in the build directory
hash = $(shell echo -n "$(1)" | md5sum | cut -d' ' -f1)
OBJS = $(foreach src,$(SRCS),$(BUILD_DIR)/$(call hash,$(src)).o)

#========================================================
#RELEASE TYPE FLAGS
#========================================================

RELEASE_CXXFLAGS := -O3
DEBUG_CXXFLAGS := -g -O0

#========================================================
#IN-COMMON FLAGS
#========================================================

#all targets share these flags in common
COMMON_CXXFLAGS = -std=c++20 \
-pipe \
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

#========================================================
#LIBRARY LINK TYPE FLAGS
#========================================================

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

#========================================================
#ADDITIONAL DEFINE FLAGS
#========================================================

#-D_DEBUG essentially says "redux instead of duckstation".
#on windows, this is set by MSBuild and also includes debug symbols.
#but on linux, -g is specified via DEBUG_CXXFLAGS
EXTRA_DEFINES__DEBUG := -D_DEBUG

#note to future maintainers:
#for the obj compilation (see the complex $(foreach...) below)
#LIBS are embedded in COMMON_CXXFLAGS, which means that every
#object file that uses them may interact with the linked libs
#in a way that may substantially bloat the final executable
#(but only if ld is too dumb to recognize they're all a cop(ies)
#of the same lib, and it should de-duplicate them).
#if this is the case, then fix it!

#NOTE!!!

#DO NOT ATTEMPT TO MAKE ANY TARGETS THAT RUN A "LIBS_STATIC" & "LIBS_DYNAMIC" IN A SINGLE MAKE INVOC

#directly from https://www.gnu.org/software/make/manual/html_node/Target_002dspecific.html
#Be aware that a given prerequisite will only be built once per invocation of make, 
#at most. If the same file is a prerequisite of multiple targets, and each of those 
#targets has a different value for the same target-specific variable, then the first 
#target to be built will cause that prerequisite to be built and the prerequisite will 
#inherit the target-specific value from the first target. It will ignore the 
#target-specific values from any other targets.

$(foreach src,$(SRCS),$(eval $(BUILD_DIR)/$(call hash,$(src)).o: $(src) build_dir ; \
	@echo "Compiling $$< to $$@" ; \
	$$(CC) -c $$< -o $$@ $$(COMMON_CXXFLAGS) $$(EXTRA_CXXFLAGS) $$(EXTRA_DEFINES) ; \
	))

.PHONY: build_dir
build_dir:
	mkdir -p $(BUILD_DIR)

# these targets mainly just link the obj files

#statically linked libs (will work oob on steamdeck)
duck: LIBS = $(LIBS_STATIC)
duck: EXTRA_CXXFLAGS = $(RELEASE_CXXFLAGS)
duck: $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(COMMON_CXXFLAGS) $(EXTRA_CXXFLAGS) $(EXTRA_DEFINES)

redux: LIBS = $(LIBS_STATIC)
redux: EXTRA_CXXFLAGS = $(RELEASE_CXXFLAGS)
redux: EXTRA_DEFINES = $(EXTRA_DEFINES__DEBUG)
redux: $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(COMMON_CXXFLAGS) $(EXTRA_CXXFLAGS) $(EXTRA_DEFINES)

#dynamically linked libs (won't work oob on steamdeck)
duck-dynamic: LIBS = $(LIBS_DYNAMIC)
duck-dynamic: EXTRA_CXXFLAGS = $(RELEASE_CXXFLAGS)
duck-dynamic: $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(COMMON_CXXFLAGS) $(EXTRA_CXXFLAGS) $(EXTRA_DEFINES)

redux-dynamic: LIBS = $(LIBS_DYNAMIC)
redux-dynamic: EXTRA_CXXFLAGS = $(RELEASE_CXXFLAGS)
redux-dynamic: EXTRA_DEFINES = $(EXTRA_DEFINES__DEBUG)
redux-dynamic: $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(COMMON_CXXFLAGS) $(EXTRA_CXXFLAGS) $(EXTRA_DEFINES)

#these two targets "debug", as in, -g -O0 so that you can GDB it.
duck-debug: LIBS = $(LIBS_DYNAMIC)
duck-debug: EXTRA_CXXFLAGS = $(DEBUG_CXXFLAGS)
duck-debug: $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(COMMON_CXXFLAGS) $(EXTRA_CXXFLAGS) $(EXTRA_DEFINES)

redux-debug: LIBS = $(LIBS_DYNAMIC)
redux-debug: EXTRA_CXXFLAGS = $(DEBUG_CXXFLAGS)
redux-debug: EXTRA_DEFINES = $(EXTRA_DEFINES__DEBUG)
redux-debug: $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(COMMON_CXXFLAGS) $(EXTRA_CXXFLAGS) $(EXTRA_DEFINES)

.PHONY: clean
clean:
	rm $(TARGET) || echo "Already clean!"
	rm -r $(BUILD_DIR)