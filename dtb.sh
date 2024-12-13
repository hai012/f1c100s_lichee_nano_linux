set -e
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build -j16 V=1 suniv-f1c100s-licheepi-nano.dtb
adb push ./build/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb /tmp
adb shell "dd if=/tmp/suniv-f1c100s-licheepi-nano.dtb of=/dev/mtdblock1"
adb shell "sync"
adb shell "reboot"
