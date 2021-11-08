#pragma once
#include "/opt/homebrew/Cellar/sdl2/2.0.16/include/SDL2/SDL.h"
#include "/opt/homebrew/Cellar/sdl2_image/2.0.5/include/SDL2/SDL_image.h"
#include "Entity.h"
#include "Math.h"

class Tile : public Entity
{
    public:
    Tile(Vector2f p_pos, SDL_Texture* p_tex);

    private:
};