#!/bin/bash
mkdir -p ~/.bin
PATH="${HOME}/.bin:${PATH}"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+rx ~/.bin/repo

mkdir -p ~/halium
cd ~/halium
repo init -u https://github.com/Halium/android.git -b halium-12.0 --depth 1
repo sync
git clone https://github.com/TheMuppets/proprietary_vendor_samsung -b lineage-19.1 vendor/samsung --depth 1
source ./build/envsetup.sh
lunch halium_beyond0lte-userdebug
mka vendorimage
