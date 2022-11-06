#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "Please run as sudo"
    exit
fi

if [ "$1" != "" ]; then
    DEVICE=$1
else
    echo "Please run this program with the argument 'eMMC' or 'SD' "
    exit
fi

if [ "$DEVICE" != "sd" ] && [ "$DEVICE" != "eMMC" ]; then
    echo "Please use SD or eMMC as an argument"
    exit
fi

if [ "$DEVICE" == "eMMC" ]; then
    (
    echo d
    echo 2
    echo n
    echo p
    echo 2
    echo 196608
    echo
    echo 
    echo w
    ) | fdisk /dev/mmcblk2
    resize2fs /dev/mmcblk2p2
fi

if [ "$DEVICE" == "sd" ]; then
    (
    echo d
    echo 2
    echo n
    echo p
    echo 2
    echo 196608
    echo
    echo 
    echo w
    ) | fdisk /dev/mmcblk1
    resize2fs /dev/mmcblk1p2
fi

exit
