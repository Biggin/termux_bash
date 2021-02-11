#!/bin/bash
rm .version
# Bash Color
green='\033[01;32m'
red='\033[01;31m'
blink_red='\033[05;31m'
restore='\033[0m'

clear

# Resources
THREAD="-j$(grep -c ^processor /proc/cpuinfo)"
KERNEL="Image"
DTBIMAGE="dtb"
DEFCONFIG="bullhead_defconfig"

# Kernel Details
VER="ICB.bullhead"

# Paths
KERNEL_DIR=`pwd`
REPACK_DIR="${HOME}/android/AnyKernel2"
PATCH_DIR="${HOME}/android/AnyKernel2/patch"
MODULES_DIR="${HOME}/android/AnyKernel2/modules"
ZIP_MOVE="${HOME}/android/AKreleases"
ZIMAGE_DIR="${HOME}/android/source/kernel/bullhead/pure/arch/arm64/boot/"

# Functions
function clean_all {
		rm -rf $MODULES_DIR/*
		git reset --hard > /dev/null 2>&1
		git clean -f -d > /dev/null 2>&1
		cd $KERNEL_DIR
		echo
		make clean && make mrproper
}

function make_kernel {
		echo
		make $DEFCONFIG
		make $THREAD

}

function make_modules {
		rm `echo $MODULES_DIR"/*"`
		find $KERNEL_DIR -name '*.ko' -exec cp -v {} $MODULES_DIR \;
}

function make_boot {
		cp -vr $ZIMAGE_DIR/Image.gz-dtb ~/android/AnyKernel2/zImage
}


function make_zip {
		cd ~/android/AnyKernel2
		zip -r9 `echo $AK_VER`.zip *
		mv  `echo $AK_VER`.zip $ZIP_MOVE
		cd $KERNEL_DIR
}



DATE_START=$(date +"%s")


echo -e "${green}"
echo "-----------------"
echo "Magic happening:"
echo "-----------------"
echo -e "${restore}"

while read -p "Do you want to use GCC 4.9(1) ?" echoice
do
case "$echoice" in

	1 )
		export PATH=$PATH:~/android/toolchain/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin
		export CROSS_COMPILE=aarch64-linux-android-
		TC="GCC4.9"
		echo
		echo "Using GCC 4.9"
		break
		;;
	* )
		echo
		echo "Invalid try again!"
		echo
		;;
esac
done

# Vars
BASE_AK_VER="0.1-"
AK_VER="$BASE_AK_VER$VER"
export LOCALVERSION=~`echo $AK_VER`
export LOCALVERSION=~`echo $AK_VER`
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER=icrunchbanger
export KBUILD_BUILD_HOST=bl

echo

while read -p "Do you want to clean stuffs (y/n) ?" cchoice
do
case "$cchoice" in
	y|Y )
		clean_all
		echo
		echo "All Cleaned now."
		break
		;;
	n|N )
		break
		;;
	* )
		echo
		echo "Invalid try again!"
		echo
		;;
esac
done

echo

while read -p "Do you want to build (y/n) ?" dchoice
do
case "$dchoice" in
	y|Y )
		make_kernel
		make_dtb
		make_modules
		make_boot
		make_zip
		break
		;;
	n|N )
		break
		;;
	* )
		echo
		echo "Invalid try again!"
		echo
		;;
esac
done


echo -e "${green}"
echo "-------------------"
echo "Build Completed in:"
echo "-------------------"
echo -e "${restore}"

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
echo
