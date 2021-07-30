#include "Tile.h"
#include "Entity.h"
#include "Math.h"
#include <SDL2/SDL.h>

Tile::Tile(Vector2f p_pos, SDL_Texture* p_tex)
:Entity(p_pos, p_tex)
{
}