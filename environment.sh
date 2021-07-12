#!/usr/bin/env bash
set -e

sudo apt-get update
sudo apt-get install -y --no-install-recommends sudo curl git python python-openssl wget zip unzip mingw-w64
sudo apt-get -y install build-essential pkg-config libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm
sudo python -c "import sys; print(sys.version)" && sudo python -m pip install scons && sudo python --version && sudo scons --version