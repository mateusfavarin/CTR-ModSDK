TARGET := Server
CC := g++

SRCS := $(wildcard src/*.cpp)
SRCS += ../../externals/enet/callbacks.c
SRCS += ../../externals/enet/compress.c
SRCS += ../../externals/enet/host.c
SRCS += ../../externals/enet/list.c
SRCS += ../../externals/enet/packet.c
SRCS += ../../externals/enet/peer.c
SRCS += ../../externals/enet/protocol.c
SRCS += ../../externals/enet/unix.c

CXXFLAGS += -std=c++20
CXXFLAGS += -O3
CXXFLAGS += -DCLIENT_SERVER
CXXFLAGS += -Isrc
CXXFLAGS += -I../../decompile/General/AltMods
CXXFLAGS += -I../../externals/enet/include

build:
	$(CC) $(SRCS) -o $(TARGET) $(CXXFLAGS)

clean:
	rm $(TARGET)