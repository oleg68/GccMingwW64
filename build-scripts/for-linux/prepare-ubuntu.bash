#!/bin/bash

set -e

sudo sed -i 's/Types: deb$/Types: deb deb-src/' /etc/apt/sources.list.d/ubuntu.sources
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y devscripts build-essential
sudo apt-get build-dep -y gcc-mingw-w64

sudo mkdir -p /usr/src/gcc-mingw-w64-src
pushd /usr/src/gcc-mingw-w64-src
sudo apt-get source --download-only gcc-mingw-w64
popd
