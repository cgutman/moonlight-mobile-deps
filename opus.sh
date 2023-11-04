#!/bin/bash
set -e

# $1 - Architecture
# $2 - SDK name (iphoneos/appletvos)
# $3 - OS name (ios/tvos)
# $4 - Opus host type

tar xzf opus-$OPUS_VERSION.tar.gz
pushd opus-$OPUS_VERSION

export SDKROOT=$(xcrun --sdk $2 --show-sdk-path)
export LIBRARY_PATH="$LIBRARY_PATH:$SDKROOT/usr/lib"

# Build Opus
mkdir ../build/opus_$3_$1
./configure --prefix=$PWD/../build/opus_$3_$1 \
            --disable-shared --enable-static --with-pic --disable-extra-programs --disable-doc \
            --host=$4 \
            CPP="$(xcrun -f clang) -arch $1 --target=$1-apple-$3 -E" \
            CFLAGS="$CFLAGS -O3 -g -m$3-version-min=$OS_MIN -arch $1 --target=$1-apple-$3 -isysroot $(xcrun --sdk $2 --show-sdk-path)" \
            LDFLAGS="$LDFLAGS -m$3-version-min=$OS_MIN -arch $1"
make -j$(sysctl -n hw.ncpu)
make install

popd
rm -rf opus-$OPUS_VERSION