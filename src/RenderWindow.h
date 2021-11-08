#pragma once
#include "/opt/homebrew/Cellar/sdl2/2.0.16/include/SDL2/SDL.h"
#include "/opt/homebrew/Cellar/sdl2_ttf/2.0.15/include/SDL2/SDL_ttf.h"
#include "/opt/homebrew/Cellar/sdl2_image/2.0.5/include/SDL2/SDL_image.h"

#include "Entity.h"

class RenderWindow
{
public:
	RenderWindow(const char* p_title, int p_w, int p_h);
	SDL_Texture* loadTexture(const char* p_filePath);
	void cleanUp();
	void clear();
	void render(Entity& p_entity);
	void render(int x, int y, SDL_Texture* p_tex);
	void render(float p_x, float p_y, const char* p_text, TTF_Font* font, SDL_Color textColor);
	void renderCenter(float p_x, float p_y, const char* p_text, TTF_Font* font, SDL_Color textColor);
	void display();
private:
	SDL_Window* window;
	SDL_Renderer* renderer;
};