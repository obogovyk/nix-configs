#!/bin/bash

virt-install \
--connect qemu:///system \
--virt-type kvm \
--name=ora-vmm-2.2 \
--metadata title="Oracle VM Manager 2.2 x86" \
--arch=i686 \
--memory=384,maxmemory=512 \
--disk path=/var/lib/libvirt/images/ora-vmm-2.2,size=8,sparse=false,cache=none,format=vmdk,bus=virtio \
--graphics spice \
--vcpus cores=1  \
--boot=cdrom \
--cdrom=/home/***/Downloads/ISO/CentOS-6.6-i386-minimal.iso \
--network bridge=virbr0 \
--os-type=linux \
--os-variant=centos6.5
