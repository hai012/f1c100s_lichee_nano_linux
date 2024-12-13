#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build licheepi_nano_defconfig
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build saveconfig
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build defconfig
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build menuconfig

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build -j16 zImage

KERNEL_FILE=build/arch/arm/boot/zImage
file3="$KERNEL_FILE"
max_size3=4194304  # file3 的大小限制 4MiB
# 判断文件3大小
file_size3=$(stat -c %s "$file3")
if [ "$file_size3" -gt "$max_size3" ]; then
    echo "$file3 文件大小超过 $max_size3 字节"
    exit
fi

adb push build/arch/arm/boot/zImage /tmp
adb shell "dd if=/tmp/zImage of=/dev/mtdblock2"
adb shell "sync"
adb shell "reboot"
