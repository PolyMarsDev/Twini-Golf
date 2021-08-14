# Twini-Golf

Twini-Golf is a game created in 48 hours for the [2021 GMTK Game Jam](https://itch.io/jam/gmtk-2021) using C++ and [SDL2](https://www.libsdl.org/). It can be played on [itch.io](https://polymars.itch.io/twini-golf).

## Screenshots

![gameimg](https://img.itch.zone/aW1hZ2UvMTA4NTg3OS82MjU2MjM4LmdpZg==/347x500/e7XF4j.gif)
![gamegif](https://img.itch.zone/aW1hZ2UvMTA4NTg3OS82MjU2MzQzLmdpZg==/347x500/EwUBBI.gif)

## Background

Twini-Golf is an experimental mini golf game where you play on multiple golf courses at once, simultaneously controlling each ball. More information on how to play is available on the game's [itch.io page](https://polymars.itch.io/twini-golf).

## Compiling

The sections below describe how to compile your own copy of Twini-Golf based on your platform.

### Windows

After installing [Mingw64](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/8.1.0/threads-win32/seh/x86_64-8.1.0-release-win32-seh-rt_v6-rev0.7z/download), [SDL2](https://www.libsdl.org/download-2.0.php), [SDL_Image](https://www.libsdl.org/projects/SDL_image/), [SDL_TTF](https://www.libsdl.org/projects/SDL_ttf/), and [SDL_Mixer](https://www.libsdl.org/projects/SDL_mixer/), execute the following command in the project's root directory

    make win

The compiled `.exe` is located in `./bin`. For it to run, you must copy all ``.dll`` files from your SDL installation to its location.

### Linux

After installing the dev packages of SDL2 for your distribution, execute the following command in the project's root directory

    make linux

The compiled binary ``main`` is located in ``./bin``. Resource files are automatically copied over.

### Web (Untested)

Install [emscripten](https://emscripten.org/docs/getting_started/downloads.html) and execute the following command in the project's root directory

    make web

The compiled ``.js``, ``.wasm``, ``.data``, and ``.html`` files are located in the project's root.

## Contributing

Pull requests are welcome! For major refactors, please open an issue first to discuss what you would like to improve. Feel free to create a fork of this repository or use the code for any other noncommercial purposes.
