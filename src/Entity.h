#pragma once
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

#include "Math.h"

class Entity
{
public:
	Entity(Vector2f p_pos, SDL_Texture* p_tex);
	Vector2f& getPos()
	{
		return pos;
	}
	float getAngle()
	{
		return angle;
	}
	Vector2f getScale()
	{
		return scale;
	}
	void setPos(float x, float y);
	void setScale(float w, float h);
	void setAngle(float angle);
	SDL_Texture* getTex();
	void update(double deltaTime);
	SDL_Rect getCurrentFrame();
private:
	Vector2f pos;
	float angle = 0;
	Vector2f scale = Vector2f(1, 1);
	SDL_Rect currentFrame;
	SDL_Texture* tex;
};