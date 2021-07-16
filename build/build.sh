#!/usr/bin/env bash
set -e

echo "Godot Version ${GODOT_VERSION} "
wget https://github.com/godotengine/godot/archive/${GODOT_VERSION}-stable.zip
unzip ${GODOT_VERSION}-stable.zip

scons -j2 verbose=yes warnings=all werror=yes platform=linuxbsd tools=yes tests=no target=release_debug production=yes
scons -j2 verbose=yes warnings=all werror=yes platform=windows tools=yes tests=no target=release_debug production=yes
