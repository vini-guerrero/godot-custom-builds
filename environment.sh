#!/usr/bin/env bash
set -e

apt-get update
apt-get install -y --no-install-recommends sudo curl git python python-openssl wget zip unzip
apt-get -y install build-essential pkg-config libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm
python -c "import sys; print(sys.version)" && python -m pip install scons && python --version && scons --version