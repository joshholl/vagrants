#!/usr/bin/env bash

if [ ! -f /tmp/VBoxGuestAdditions.iso ]
then
  echo "Unable to find additions....exiting"
  exit 1
fi

# Mount the disk image
cd /tmp
sudo mkdir /tmp/isomount
sudo mount -t iso9660 -o loop /tmp/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
export KERN_SRC=/usr/src/kernels/$(uname -r)
sudo /tmp/isomount/VBoxLinuxAdditions.run --nox11

# Cleanup
sudo umount isomount
sudo rm -rf isomount /root/VBoxGuestAdditions.iso
