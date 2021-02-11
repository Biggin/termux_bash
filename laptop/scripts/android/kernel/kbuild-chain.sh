#!/usr/bin/env bash

## Kernel Build Flags
export ARCH=arm64
export SUBARCH=arm64
#export CROSS_COMPILE=/opt/toolchains/prebuilts/arm-eabi-4.8/bin/arm-eabi-
export CROSS_COMPILE=/opt/toolchains/prebuilts/aarch64-linux-android-4.8/bin/aarch64-linux-android-

## My personal variables to simplify life a little bit
export Build=/media/external/build/kernel-out

## Custom defconfig values for simplification of code
export Conf=zeroflteusc_02_defconfig
export Conf1=nethunter_defconfig
export Conf2=lineageos_zeroflteusc_defconfig
export Conf3=biggz_defconfig
