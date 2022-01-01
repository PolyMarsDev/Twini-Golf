#pragma once

// if we're building on Windows via Visual Studio
#ifdef _MSC_VER
#include <SDL.h>
#include <SDL_image.h>
#include <SDL_ttf.h>
#include <SDL_mixer.h>
#else
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_mixer.h>
#endif

#include <string>
#include <iostream>
#include <vector>
