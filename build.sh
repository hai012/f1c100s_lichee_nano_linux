# make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build licheepi_nano_defconfig
# make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build menuconfig
# cp  build/.config defconfig
# cp defconfig build/.config

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build -j16 zImage
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build -j16 suniv-f1c100s-licheepi-nano.dtb
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build -j16 modules

rm -rf build/out
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build  INSTALL_MOD_PATH=out modules_install -j16
