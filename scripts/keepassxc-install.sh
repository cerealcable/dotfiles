#!/usr/bin/env bash
set -e

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

apt-get remove -y keepassx
add-apt-repository -u -y ppa:phoerious/keepassxc
apt-get install -y keepassxc
