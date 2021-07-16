#!/usr/bin/env bash
set -e

echo -e "\n Godot Version ${GODOT_VERSION} \n"
wget https://github.com/godotengine/godot/archive/${GODOT_VERSION}-stable.zip
unzip ${GODOT_VERSION}-stable.zip

# scons -j2 verbose=yes warnings=all werror=yes platform=linuxbsd tools=yes tests=no target=release_debug production=yes
# scons -j2 verbose=yes warnings=all werror=yes platform=windows tools=yes tests=no target=release_debug
# scons verbose=yes warnings=all werror=yes platform=osx tools=yes target=release_debug debug_symbols=no --jobs=2

# echo -e "\n Godot Engine Compile Outputs \n"
pwd && ls
