#!/sbin/sh
cd /tmp/
/tmp/dd if=/dev/block/platform/msm_sdcc.1/by-name/boot of=/tmp/boot.img
/tmp/unpackbootimg /tmp/boot.img
/tmp/mkbootimg --kernel /tmp/zImage --ramdisk /tmp/boot.img-ramdisk.gz --cmdline 'panic=3 console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3' --base 0x80200000  --ramdiskaddr 0x82200000 -o /tmp/newboot.img
/tmp/dd if=/tmp/newboot.img of=/dev/block/platform/msm_sdcc.1/by-name/boot
busybox chmod 644 /system/lib/modules/*
