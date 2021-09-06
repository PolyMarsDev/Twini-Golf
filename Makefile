# Global variables
EMCC       ?= emcc
CXXFLAGS   ?= -std=c++14 -O3 -Wall -m64 -I include
LDFLAGS    ?= -lSDL2main -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer
EMCCFLAGS  ?= -O2 -s USE_SDL=2 \
	-s USE_SDL_IMAGE=2 \
	-s 'SDL2_IMAGE_FORMATS=["png"]' \
	-s USE_SDL_TTF=2 \
	-s USE_SDL_MIXER=2

SRC      := $(wildcard src/*.cpp)
BASEPATH := bin/releases

# Check the OS and assign variables
ifeq ($(OS),Windows_NT)
SDL2PATH        ?= C:/SDL2-w64
SDL2LIBPATH     := $(SDL2PATH)/lib
SDL2INCLUDEPATH := $(SDL2PATH)/include

LDFLAGS += -lmingw32 -L $(SDL2LIBPATH)
CXXFLAGS  += -I $(SDL2INCLUDEPATH)
OUTPATH := $(BASEPATH)/win
OUTPUT  := $(OUTPATH)/tgolf.exe
endif

OUTPATH := $(BASEPATH)/linux
OUTPUT  := $(OUTPATH)/tgolf

all: build

normal-prep:
	mkdir -p $(BASEPATH) $(OUTPATH)
	cp -vr res/* $(OUTPATH)

web-prep:
	mkdir -p $(BASEPATH)/web-build
	cp -vr res/* $(BASEPATH)/web-build

build: normal-prep
	$(CXX) -c $(SRC) $(CXXFLAGS)
	$(CXX) *.o -o $(OUTPUT) -s $(LDFLAGS)

web: web-prep
	$(EMCC) $(SRC) -I include $(EMCCFLAGS) \
		--preload-file res \
		-o index.html
	cp -t $(BASEPATH)/web-build index.html index.js \
		index.data index.wasm

.PHONY: all normal-prep web-prep build web
