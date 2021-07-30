#pragma once
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_mixer.h>
#include <vector>
#include "Hole.h"
#include "Tile.h"

#include "Entity.h"
#include "Math.h"

class Ball : public Entity
{
public:
	Ball(Vector2f p_pos, SDL_Texture* p_tex, SDL_Texture* p_pointTex, SDL_Texture* p_powerMTexFG, SDL_Texture* p_powerMTexBG, int p_index);
    Vector2f& getVelocity()
	{
		return velocity;
	}
    Vector2f& getInitialMousePos()
	{
		return initialMousePos;
	}
    std::vector<Entity> getPoints()
	{
		return points;
	}
    std::vector<Entity> getPowerBar()
	{
		return powerBar;
	}
    int getStrokes()
    {
        return strokes;
    }
    bool isWin()
    {
        return win;
    }
    void setWin(bool p_win);
    void setInitialMousePos(float x, float y);
    void setVelocity(float x, float y);
    void setLaunchedVelocity(float x, float y);
    void update(double deltaTime, bool mouseDown, bool mousePressed, std::vector<Tile> tiles, std::vector<Hole> holes,Mix_Chunk* chargeSfx, Mix_Chunk* swingSfx, Mix_Chunk* holeSfx);
private:
    Vector2f velocity;
    Vector2f target;
    Vector2f launchedVelocity;
    float velocity1D;
    float launchedVelocity1D;
    Vector2f initialMousePos;
    bool canMove = true;
    bool playedSwingFx = true;
    int index;
    int strokes = 0;
    int dirX = 1;
    int dirY = 1;
    bool win = false;
    float friction = 0.001;
    std::vector<Entity> points;
    std::vector<Entity> powerBar;
};