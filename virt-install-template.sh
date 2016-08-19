#!/bin/bash

OS_NAME="centos6.8-min_x64"
qemu-img create -f qcow2 -o preallocation=metadata /var/lib/libvirt/images/$OS_NAME.qcow2 12G

virt-install \
--name=$OS_NAME \
--vcpus=2 --ram=2048 \
--disk path=/var/lib/libvirt/images/$OS_NAME.qcow2,format=qcow2,cache=none,device=disk,bus=virtio \
--disk path=/opt/iso/CentOS-6.8-x86_64-minimal.iso,device=cdrom \
--cdrom=/opt/iso/CentOS-6.8-x86_64-minimal.iso \
--network bridge=virbr0 \
--os-type=linux \
--os-variant=rhel6 \
--vnc \
--keymap=en-us \
--hvm \
--autostart

virt-viewer -c qemu:///system $OS_NAME
