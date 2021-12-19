#!/bin/sh

mkdir -p /tmp/etc/qemu
echo "allow bridge1" | tee -a /tmp/etc/qemu/bridge.conf
ip link add bridge1 type bridge
ip link set dev eno1 master bridge1
ip link up bridge1
dhclient bridge1
