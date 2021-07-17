#!/usr/bin/env bash
set -e

echo "\n\n ✔ Export Script Triggered Successfully. \n\n "

echo -e "\n Build Platform ${{inputs.environment}} \n" &&
echo -e "\n android_sdk_path -> ${ANDROID_HOME} \n adb -> ${ANDROID_HOME}/platform-tools \n" 

# # Environment Variables
# GODOT_RELEASE="${ROOT_PATH:="stable"}" &&
# ROOT_PATH="${ROOT_PATH:="/github/home"}" &&
# WORKSPACE_PATH="${WORKSPACE_PATH:="/github/workspace"}" &&
# TRES_PATH=${ROOT_PATH}/.config/godot/editor_settings-3.tres &&
# LINK_GODOT="https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux_headless.64.zip" &&
# LINK_TEMPLATES="https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_export_templates.tpz" &&

# wget ${LINK_GODOT} &&
# wget ${LINK_TEMPLATES} &&
# sudo mkdir -p -v $ROOT_PATH/.cache && sudo mkdir -p -v $ROOT_PATH/.config/godot &&
# sudo mkdir -p -v $ROOT_PATH/.local/share/godot/templates/${GODOT_VERSION}.${GODOT_RELEASE} &&

# unzip Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux_headless.64.zip && sudo mv Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux_headless.64 /usr/local/bin/godot &&
# unzip Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_export_templates.tpz && sudo mv templates/* $ROOT_PATH/.local/share/godot/templates/${GODOT_VERSION}.${GODOT_RELEASE} &&

# echo "\n ✔ Godot Editor First Launch. \n " &&
# cd / && chmod +x /usr/local/bin/godot && godot -e -q &&
# echo "\n ✔ Godot Editor Launched. \n " &&

# sudo keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999 && pwd && ls -l