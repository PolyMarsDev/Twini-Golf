#include "Tile.h"
#include "Entity.h"
#include "Math.h"
#include "/opt/homebrew/Cellar/sdl2/2.0.16/include/SDL2/SDL.h"

Tile::Tile(Vector2f p_pos, SDL_Texture* p_tex)
:Entity(p_pos, p_tex)
{
}