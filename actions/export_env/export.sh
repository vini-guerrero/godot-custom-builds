#!/usr/bin/env bash
set -e

echo "\n\n ✔ Export Script Triggered Successfully. \n\n "

# Install Export Dependencies
# sudo apt-get update
sudo apt-get install -y -qq apksigner

# Environment Variables
GODOT_PATH="${GODOT_PATH:="/usr/local/bin"}"
GODOT_RELEASE="${GODOT_RELEASE:="stable"}"
EXPORT_PATH="${EXPORT_PATH:="game"}"
TRES_PATH="${HOME}/.config/godot/editor_settings-3.tres"
LINK_GODOT="https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux_headless.64.zip"
LINK_TEMPLATES="https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_export_templates.tpz"

wget -q ${LINK_GODOT}
wget -q ${LINK_TEMPLATES}
sudo mkdir -p -v /.cache && sudo mkdir -p -v /.config/godot
sudo mkdir -p -v /root/.local/share/godot/templates/${GODOT_VERSION}.${GODOT_RELEASE}

unzip -qq Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux_headless.64.zip && sudo mv Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux_headless.64 ${GODOT_PATH}/godot
unzip -qq Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_export_templates.tpz && sudo mv templates/* /root/.local/share/godot/templates/${GODOT_VERSION}.${GODOT_RELEASE}

echo "\n ✔ Godot Editor First Launch. \n " 
sudo chmod +x ${GODOT_PATH}/godot && sudo ${GODOT_PATH}/godot -e -q
echo "\n ✔ Godot Editor Launched. \n "

# Generate Keystore
sudo keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore /usr/local/lib/android/debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999

# Set Editor Settings For Android Export
echo "\n ✔ Preparing Android Project Export Setup \n"  
sudo sed -i '/\[resource\]/a export\/android\/android_sdk_path = "/usr/local/lib/android/sdk"' ${TRES_PATH} \
&& sudo sed -i '/\[resource\]/a export\/android\/adb = "/usr/local/lib/android/sdk/platform-tools"' ${TRES_PATH} \
&& sudo sed -i '/\[resource\]/a export\/android\/jarsigner = "/usr/bin/jarsigner"' ${TRES_PATH} \
&& sudo sed -i '/\[resource\]/a export\/android\/apksigner = "/usr/bin/apksigner"' ${TRES_PATH} \
&& sudo sed -i '/\[resource\]/a export\/android\/debug_keystore = "/usr/local/lib/android/debug.keystore"' ${TRES_PATH} \
&& sudo sed -i '/\[resource\]/a export\/android\/debug_user = "androiddebugkey"' ${TRES_PATH} \
&& sudo sed -i '/\[resource\]/a export\/android\/debug_pass = "android"' ${TRES_PATH}

# Validate Editor Settings
sudo cat ${TRES_PATH} 
echo "\n ✔ Export Path \n"
cd ${EXPORT_PATH} && mkdir -v -p "build/Android"

echo "\n ✔ Exporting Android Platform \n"
sudo godot --verbose --export-debug "Android" "build/Android/game.debug.apk"
zip -r Android.zip build/Android

echo "\n ✔ Exported Builds \n"
pwd && ls -l
