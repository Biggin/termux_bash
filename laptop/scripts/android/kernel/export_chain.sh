#!/usr/bin/env bash

## The <arch> of my current build
export ARCH=arm64
export SUBARCH=arm64

## The current location of my toolchain that I can get the system to recognize...
export CROSS_COMPILE='/opt/toolchains/prebuilts/arm-eabi-4.8/bin/arm-eabi-'
#export CROSS_COMPILE='/opt/toolchains/prebuilts/aarch64-linux-android-4.8/bin/aarch64-linux-android-'
#export CROSS_COMPILE='/home/tux/Android/pie/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.8/bin/aarch64-linux-android-'
