#pragma once
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include "Entity.h"
#include "Math.h"

class Tile : public Entity
{
    public: 
    Tile(Vector2f p_pos, SDL_Texture* p_tex);

    private:
};