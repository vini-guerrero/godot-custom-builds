#!/usr/bin/env bash
set -e

echo -e "✔ Modules Script Triggered Successfully."
sudo mkdir -p -v engine

sudo apt-get update &&
sudo apt-get install -y --no-install-recommends curl git python python3-pip python-openssl wget zip unzip mingw-w64 &&
sudo apt-get -y install build-essential pkg-config libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm &&
sudo pip3 install scons &&
sudo python -c "import sys; print(sys.version)" && sudo python --version && sudo scons --version &&
sudo wget https://github.com/godotengine/godot/archive/refs/heads/${{ inputs.godot_branch }}.zip &&
sudo unzip ${{ inputs.godot_branch }}.zip && sudo mv godot-${{ inputs.godot_branch }}/* ${GITHUB_WORKSPACE}/engine


if [ "${CUSTOM_MODULES}" != "" ]; then
    IFS="|" read -a GODOT_CUSTOM_MODULES <<< ${CUSTOM_MODULES}
    echo -e "✔ Received ${#GODOT_CUSTOM_MODULES[@]} Custom Modules.\n${GODOT_CUSTOM_MODULES[@]}"
fi
# MODULE_INDEX=0
for m in "${GODOT_CUSTOM_MODULES[@]}"; do
    # sudo wget -qc "$m" -O module_${MODULE_INDEX}.zip && sudo unzip -Z1 module_${MODULE_INDEX}.zip
    sudo wget -qc "$m" -O temp.zip && sudo unzip -qq temp.zip -d ${GITHUB_WORKSPACE}/engine && sudo rm temp.zip
    # ((MODULE_INDEX++))
    # FILE=$(eval "sudo wget -qc "$m" -O temp.zip && sudo unzip -Z1 temp.zip")
    # echo -e ${FILE}
done

ls -l ${GITHUB_WORKSPACE}/engine