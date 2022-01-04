#!/bin/bash
cd /tmp/twrp

export TARGET=recoveryimage
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z

. build/envsetup.sh
lunch omni_vince-eng
export ALLOW_MISSING_DEPENDENCIES=true
mka $TARGET
