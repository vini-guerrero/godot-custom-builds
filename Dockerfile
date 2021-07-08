FROM debian:buster

RUN apt-get update
RUN apt-get -y install git wget unzip mingw-w64

RUN wget https://github.com/godotengine/godot/archive/3.3.2-stable.zip

RUN unzip 3.2.3-stable.zip

WORKDIR "/godot-3.2.3-stable/modules"
RUN git clone https://github.com/Zylann/godot_voxel.git
RUN mv godot_voxel voxel 

RUN apt-get -y install build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev \
    libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm 

WORKDIR "/godot-3.2.3-stable/"

RUN scons -j6 platform=windows tools=yes target=release_debug bits=64

RUN ls && pwd