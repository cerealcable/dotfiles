#!/usr/bin/env bash
set -e

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

add-apt-repository -u -y ppa:git-core/ppa
apt-get install -y git
