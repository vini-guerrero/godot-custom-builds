#!/usr/bin/env bash
set -e

apt-get update && apt-get install -y --no-install-recommends sudo ca-certificates curl git python python-openssl unzip wget zip openjdk-8-jdk apksigner dirmngr apt-transport-https lsb-release # graphicsmagick
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt -y install nodejs 
# locales-all
rm -rf /var/lib/apt/lists/*


# Android SDK Export Dependencies
sudo mkdir -p -v /root/android-sdk-installer/cmdline-tools && cd /root/android-sdk-installer/cmdline-tools
wget "https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip"
# curl -fsSLO "https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip"
unzip -q commandlinetools-linux-*.zip
rm commandlinetools-linux-*.zip
mv cmdline-tools latest
sudo mkdir -p -v /root/.android && echo "count=0" > /root/.android/repositories.cfg
sudo yes | /root/android-sdk-installer/cmdline-tools/latest/bin/sdkmanager --licenses
sudo yes | /root/android-sdk-installer/cmdline-tools/latest/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "build-tools;30.0.3" "platforms;android-29" "cmdline-tools;latest" "cmake;3.10.2.4988404" "ndk;21.4.7075529"
sudo cd /root && rm -rf /root/android-sdk-installer 