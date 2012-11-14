#!/bin/bash
# Link kvm to the path that OpenNebula knows
ln -s /usr/libexec/qemu-kvm /usr/bin/kvm
# Create emtpy directory waiting to be mounted
mkdir /datastores
chmod 777 /datastores
mkdir /datastores/1
mkdir /datastores/102
