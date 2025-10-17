#!/bin/bash

set -e

mkdir -p build/ubuntu
pushd build/ubuntu

cp -av /usr/src/gcc-mingw-w64-src/* ./
rm -rf gcc-mingw-w64-*
dpkg-source -x gcc-mingw-w64*.dsc

cd gcc-mingw-w64-*
debuild -us -uc

popd
