#!/usr/bin/env bash
set -e

echo -e "✔ Modules Script Triggered Successfully."

if [ "${CUSTOM_MODULES}" != "" ]; then
    IFS="|" read -a GODOT_CUSTOM_MODULES <<< ${CUSTOM_MODULES}
    echo -e "✔ Received ${#GODOT_CUSTOM_MODULES[@]} Custom Modules.\n${GODOT_CUSTOM_MODULES[@]}"
fi
for m in "${GODOT_CUSTOM_MODULES[@]}"; do
    FILE=$(eval "sudo wget -qc "$m" -O temp.zip && sudo unzip -Z1 temp.zip")
    echo -e ${FILE}
done
sudo ls -l