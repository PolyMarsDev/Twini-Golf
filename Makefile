# Global variables
G++        ?= g++
EMCC       ?= emcc
CFLAGS     ?= -std=c++14 -O3 -Wall -m64
LDFLAGS    ?= -lSDL2main -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer
EMCC_FLAGS ?= -O2 -s USE_SDL=2 -s USE_SDL_IMAGE=2 -s 'SDL2_IMAGE_FORMATS=["png"]' -s USE_SDL_TTF=2 -s USE_SDL_MIXER=2

SRC      := src/*.cpp
BASEPATH := bin/releases

# Check the OS and assign variables
ifeq ($(OS),Windows_NT)
SDL2PATH          ?= C:/SDL2-w64
SDL2_LIB_PATH     := $(SDL2PATH)/lib
SDL2_INCLUDE_PATH := $(SDL2PATH)/include

LDFLAGS    += -lmingw32 -L $(SDL2_LIB_PATH)
MISC_FLAGS := -I include -I $(SDL2_INCLUDE_PATH)
OUTPATH    := $(BASEPATH)/win
OUTPUT     := $(OUTPATH)/tgolf.exe
else
MISC_FLAGS  := -I include
OUTPATH     := $(BASEPATH)/linux
OUTPUT      := $(OUTPATH)/tgolf
endif

all: build

prep:
	mkdir -p $(BASEPATH) $(OUTPATH)
	cp -vr res/* $(OUTPATH)

build: prep
	$(G++) -c $(SRC) $(CFLAGS) $(MISC_FLAGS)
	$(G++) *.o -o $(OUTPUT) -s $(LDFLAGS)

web:
	mkdir -p $(BASEPATH)/web-build
	$(EMCC) $(SRC) -I include $(EMCC_FLAGS) \
		--preload-file res \
		-o index.html
	cp -t $(BASEPATH)/web-build index.html index.js \
		index.data index.wasm

.PHONY: all build web
