# FROM ubuntu:20.04

# RUN apt-get update

# RUN apt-get install -y --no-install-recommends sudo curl git python python-openssl wget zip unzip

# RUN apt-get -y install build-essential pkg-config libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm

# RUN python -c "import sys; print(sys.version)" && python -m pip install scons && python --version && scons --version

# COPY environment.sh /usr/local/bin/environment.sh

# ENTRYPOINT ["environment.sh"]

FROM debian:buster

RUN apt-get update

COPY build.sh /usr/local/bin/build.sh

RUN pwd && ls

RUN ls /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/build.sh"]

# RUN apt-get -y install git wget unzip mingw-w64 scons

# RUN wget https://github.com/godotengine/godot/archive/${GODOT_VERSION}-stable.zip

# RUN unzip ${GODOT_VERSION}-stable.zip

# # WORKDIR "/godot-${GODOT_VERSION}-stable/modules"
# # RUN git clone https://github.com/Zylann/godot_voxel.git
# # RUN mv godot_voxel voxel 

# RUN apt-get -y install build-essential pkg-config libx11-dev libxcursor-dev \
#     libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm

# WORKDIR "/godot-${GODOT_VERSION}-stable/"

# RUN scons -j2 verbose=yes warnings=all werror=yes platform=linuxbsd tools=yes tests=no target=release_debug production=yes

# RUN ls && pwd
