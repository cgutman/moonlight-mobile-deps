#!/bin/bash
set -e

# $1 - Architecture
# $2 - SDK name (iphoneos/appletvos)
# $3 - OS name (ios/tvos)

pushd FFmpeg

export SDKROOT=$(xcrun --sdk $2 --show-sdk-path)
export LIBRARY_PATH="$LIBRARY_PATH:$SDKROOT/usr/lib"

# Build FFmpeg
mkdir ../build/FFmpeg_$3_$1
./configure --prefix=$PWD/../build/FFmpeg_$3_$1 \
            --extra-cflags="-m$3-version-min=$OS_MIN -arch $1 --target=$1-apple-$3 -isysroot $(xcrun --sdk $2 --show-sdk-path)" \
            --extra-ldflags="-m$3-version-min=$OS_MIN -arch $1" \
            --arch=$1 \
            --enable-cross-compile --disable-all --disable-autodetect --disable-x86asm --enable-avcodec --enable-avformat --enable-muxer=flv --enable-decoder=av1
make -j$(sysctl -n hw.ncpu)
make install

# Clean up in-tree build
git reset --hard
git clean -f -d -x
popd