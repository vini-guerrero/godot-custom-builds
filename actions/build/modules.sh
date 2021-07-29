#!/usr/bin/env bash
set -e

echo -e "✔ Modules Script Triggered Successfully."
sudo mkdir -p -v engine

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
sudo ls -l && ls -l ${GITHUB_WORKSPACE}/engine