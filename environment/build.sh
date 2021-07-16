#!/usr/bin/env bash
set -e

echo "Building Godot Version ${GODOT_VERSION} "

wget https://github.com/godotengine/godot/archive/${GODOT_VERSION}-stable.zip
unzip ${GODOT_VERSION}-stable.zip
ls && pwd