#!/bin/bash
echo "removing old zip"
rm SXDNickiSS-*.zip
rm ./zip_da_kernel/modules/*.ko;
echo "lets pack the kernel to a flashable zip";
cp ./arch/arm/boot/zImage ./zip_da_kernel/kernel/;
echo "copied zImage";
cp `find -name "*.ko"` ./zip_da_kernel/modules/;
echo "copied modules";
cd zip_da_kernel;
zip ../SXDNickiSS-`date +%Y-%m-%d.%H:%M:%S`.zip -r *;
echo "just zipped everything, were ready to flash";
clear
echo "choose to flash via sideload(1) transfer to sdcard via adb(2) or any key to do finish this and do whatever the hell you want"

read n
case $n in
    1) echo "flashing via sideload" && adb sideload SXDNickiSS-*.zip;;
    2) echo "sending to sdcard" && adb push SXDNickiSS-*.zip /sdcard/SXDNickiSS-`date +%Y-%m-%d.%H:%M:%S`.zip;;
    *) echo "alright do what you wanna do"
esac
