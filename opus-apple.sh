#!/bin/bash
set -e

# $1 - Architecture
# $2 - SDK name (iphoneos/appletvos)
# $3 - OS name (ios/tvos)
# $4 - Opus host type

pushd opus

export SDKROOT=$(xcrun --sdk $2 --show-sdk-path)
export LIBRARY_PATH="$LIBRARY_PATH:$SDKROOT/usr/lib"

# Build Opus
mkdir ../build/opus_$3_$1
./autogen.sh
./configure --prefix=$PWD/../build/opus_$3_$1 \
            --disable-shared --enable-static --with-pic --disable-extra-programs --disable-doc \
            --host=$4 \
            CPP="$(xcrun -f clang) -arch $1 --target=$1-apple-$3 -E" \
            CFLAGS="$CFLAGS -O3 -g -m$3-version-min=$OS_MIN -arch $1 --target=$1-apple-$3 -isysroot $(xcrun --sdk $2 --show-sdk-path)" \
            LDFLAGS="$LDFLAGS -m$3-version-min=$OS_MIN -arch $1"
make -j$(sysctl -n hw.ncpu)
make install

git reset --hard
git clean -f -d -x
popd