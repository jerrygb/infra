#!/usr/bin/env bash
#
# Bootstrap freshly created box!
#
if [[ ${#} != 1 ]]; then
  echo "Usage: $0 NEW_HOSTNAME"
  exit 1
fi

if [[ -f /etc/.bootstrapped ]]; then
  echo "ALREADY BOOTSTRAPPED"
  exit 1
fi

NEW_HOSTNAME=${1}

set -ex

# Rename host
sudo sed -i "s/default-linux/${NEW_HOSTNAME}/g;" /etc/hosts /etc/hostname
sudo hostname -F /etc/hostname

# Generate new SSH host keys
cd /etc/ssh
sudo rm ssh_host*key*
sudo dpkg-reconfigure openssh-server

# Perform APT maintenance
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get clean

# Set bootstrap marker
sudo touch /etc/.bootstrapped

# Reboot to pick up new kernel and libc
sudo reboot
