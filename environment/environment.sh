#!/usr/bin/env bash
set -e

apt-get update
apt-get install -y --no-install-recommends curl git python python3-pip python-openssl wget zip unzip mingw-w64 scons
apt-get -y install build-essential pkg-config libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm
python -c "import sys; print(sys.version)" && python --version && scons --version