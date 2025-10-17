#!/bin/bash

# $1 - Patch source Dir. If not set then relative to the script dir

set -e

DIR=$(readlink -f $(dirname $0))

if [[ -n "$1" ]]; then
	SRC_DIR=$1
else
	SRC_DIR=$(readlink -f $(dirname $0)/../..)
fi

mkdir -p build/ubuntu
pushd build/ubuntu

cp -av /usr/src/gcc-mingw-w64-src/* ./
rm -rf gcc-mingw-w64-*
dpkg-source -x gcc-mingw-w64*.dsc

cd gcc-mingw-w64-*
patch -p1 $SRC_DIR/patches/gcc-mingw-w64-26.1.patch
debuild -us -uc

popd

