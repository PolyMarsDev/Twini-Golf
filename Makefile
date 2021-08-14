# Global variables
CC         ?= g++
EMCC       ?= emcc
CFLAGS     ?= -std=c++14 -O3 -Wall -m64
LDFLAGS    ?= -lSDL2main -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer
EMCC_FLAGS ?= -O2 -s USE_SDL=2 -s USE_SDL_IMAGE=2 -s \"SDL2_IMAGE_FORMATS=['png']\" -s USE_SDL_TTF=2 -s USE_SDL_MIXER=2

# Linux variables
INCLUDE_PATH     ?= include

# Windows variables
WIN_EXTRA_LIBS   ?= -lmingw32
WIN_EXTRA_FLAGS  ?= -L C:/SDL2-w64/lib
WIN_INCLUDE_PATH ?= C:/SDL2-w64/include

SRC      := src/*.cpp
OUT_PATH := bin/release
OUTPUT   := $(OUT_PATH)/main

all: linux

# Prepare build directories
# Copy over res files from project
prep:
	mkdir -p $(OUT_PATH)
	cp -a res/* bin

linux: prep
	$(CC) -c $(SRC) $(CFLAGS) -I $(INCLUDE_PATH)
	$(CC) *.o -o $(OUTPUT) -s $(LDFLAGS)

win: prep
	$(CC) -c $(SRC) $(CFLAGS) -I $(INCLUDE_PATH) -I $(WIN_INCLUDE_PATH)
	$(CC) *.o -o $(OUTPUT) -s $(WIN_EXTRA_FLAGS) $(WIN_EXTRA_LIBS) $(LDFLAGS)
	start $(OUTPUT)

web:
	$(EMCC) $(SRC) -I $(INCLUDE_PATH) $(EMCC_FLAGS) \
		--preload-file res \
		-o index.html

.PHONY: all linux win web
