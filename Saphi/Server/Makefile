#NOTICE: this project requires g++ 13 or later

#disable the stupid builtins
.SUFFIXES:

TARGET := Server
CC := g++

#this needs to be the first target in the file
.PHONY: all
all: server

#========================================================
#SOURCES
#========================================================

SRCS := $(wildcard src/*.cpp)
SRCS += ../../externals/enet/callbacks.c
SRCS += ../../externals/enet/compress.c
SRCS += ../../externals/enet/host.c
SRCS += ../../externals/enet/list.c
SRCS += ../../externals/enet/packet.c
SRCS += ../../externals/enet/peer.c
SRCS += ../../externals/enet/protocol.c
SRCS += ../../externals/enet/unix.c

#intermediate object cache directory
BUILD_DIR=objs
#hashes the names to prevent name collisions in the build directory
hash = $(shell echo -n "$(1)" | md5sum | cut -d' ' -f1)
OBJS = $(foreach src,$(SRCS),$(BUILD_DIR)/$(call hash,$(src)).o)

#========================================================
#RELEASE TYPE FLAGS
#========================================================

RELEASE_CXXFLAGS := -O3
DEBUG_CXXFLAGS := -g -O0 -D_DEBUG

#========================================================
#IN-COMMON FLAGS
#========================================================

#all targets share these flags in common
COMMON_CXXFLAGS = -std=c++20 \
-pipe \
-DCLIENT_SERVER \
-DFMT_HEADER_ONLY \
-DFMTLOG_HEADER_ONLY \
-Isrc \
-I../../decompile/General/AltMods \
-I../../externals/enet/include \
-I../../externals/fmtlog/fmt/include/ \
-I../../externals/fmtlog/

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
	$$(CC) -c $$< -o $$@ $$(COMMON_CXXFLAGS) $$(EXTRA_CXXFLAGS) ; \
	))

.PHONY: build_dir
build_dir:
	mkdir -p $(BUILD_DIR)

# these target(s) mainly just link the obj files

server: EXTRA_CXXFLAGS = $(RELEASE_CXXFLAGS)
server: $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(COMMON_CXXFLAGS) $(EXTRA_CXXFLAGS)

#these target(s) "debug", as in, -g -O0 so that you can GDB it.
server-debug: EXTRA_CXXFLAGS = $(DEBUG_CXXFLAGS)
server-debug: $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(COMMON_CXXFLAGS) $(EXTRA_CXXFLAGS)

.PHONY: clean
clean:
	rm $(TARGET) || echo "Already clean!"
	rm -r $(BUILD_DIR)