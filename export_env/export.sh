#!/usr/bin/env bash
set -e

echo "\n\n ✔ Export Script Triggered Successfully. \n\n "

# Install Export Dependencies
# sudo apt-get update
sudo apt-get install -y -qq apksigner

# Environment Variables
GODOT_RELEASE="${ROOT_PATH:="stable"}"
ROOT_PATH="${ROOT_PATH:="/github/home"}"
WORKSPACE_PATH="${WORKSPACE_PATH:="/github/workspace"}"
TRES_PATH="${HOME}/.config/godot/editor_settings-3.tres"
LINK_GODOT="https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux_headless.64.zip"
LINK_TEMPLATES="https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_export_templates.tpz"

wget -q ${LINK_GODOT}
wget -q ${LINK_TEMPLATES}
sudo mkdir -p -v $ROOT_PATH/.cache && sudo mkdir -p -v $ROOT_PATH/.config/godot
sudo mkdir -p -v $ROOT_PATH/.local/share/godot/templates/${GODOT_VERSION}.${GODOT_RELEASE}

unzip -qq Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux_headless.64.zip && sudo mv Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux_headless.64 /usr/local/bin/godot
unzip -qq Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_export_templates.tpz && sudo mv templates/* $ROOT_PATH/.local/share/godot/templates/${GODOT_VERSION}.${GODOT_RELEASE}

echo "\n ✔ Godot Editor First Launch. \n " 
cd / && chmod +x /usr/local/bin/godot && godot -e -q
echo "\n ✔ Godot Editor Launched. \n "

# Generate Keystore
sudo keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999 && pwd && ls -l

# Set Editor Settings For Android Export
echo "\n ✔ Preparing Android Project Export Setup \n"  
sed -i '/\[resource\]/a export\/android\/android_sdk_path = "'"${ANDROID_HOME}"'" ${TRES_PATH} \
&& sed -i '/\[resource\]/a export\/android\/adb = "'"${ANDROID_HOME/platform-tools}"'"" ${TRES_PATH} \
&& sed -i '/\[resource\]/a export\/android\/jarsigner = "/usr/bin/jarsigner"' ${TRES_PATH} \
&& sed -i '/\[resource\]/a export\/android\/apksigner = "/usr/bin/apksigner"' ${TRES_PATH} \
&& sed -i '/\[resource\]/a export\/android\/debug_keystore = "debug.keystore"' ${TRES_PATH} \
&& sed -i '/\[resource\]/a export\/android\/debug_user = "androiddebugkey"' ${TRES_PATH} \
&& sed -i '/\[resource\]/a export\/android\/debug_pass = "android"' ${TRES_PATH}

# Validate Editor Settings
sudo cat ${TRES_PATH}
# Move To Export Path
cd ${WORKSPACE_PATH}/${EXPORT_PATH} && ls 

# echo "\n ✔ Exporting Android Platform \n"
# sudo godot --verbose --export-debug "Android" "build/Android/game.debug.apk"
# zip -r Android.zip build/Android

echo "\n ✔ Exporting Linux Platform \n" 
sudo godot --verbose --export "Linux" "build/Linux/game.x86_64"
zip -r "Linux.zip" build/Linux

pwd && ls -l
