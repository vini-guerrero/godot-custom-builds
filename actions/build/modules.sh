#!/usr/bin/env bash
set -e

echo -e "✔ Modules Script Triggered Successfully."

if [ "${CUSTOM_MODULES}" != "" ]; then
    IFS="|" read -a GODOT_CUSTOM_MODULES <<< ${CUSTOM_MODULES}
    echo -e "✔ Received ${#GODOT_CUSTOM_MODULES[@]} Custom Modules.\n${GODOT_CUSTOM_MODULES[@]}"
fi
for m in "${GODOT_CUSTOM_MODULES[@]}"; do
    sudo wget -c "$m" -O temp.zip && sudo unzip temp.zip && sudo rm temp.zip
done
sudo ls -l