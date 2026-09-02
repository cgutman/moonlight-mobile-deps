#!/bin/bash
set -e

export ANDROID_NDK_ROOT=${ANDROID_NDK_ROOT:-${ANDROID_NDK_HOME:-$NDK}}
export PATH=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH
PARALLEL_JOBS=$(nproc)

BASE_ARGS="no-shared no-tests no-apps no-legacy no-dso"

pushd openssl

rm -rf ./android
mkdir -p android/armeabi-v7a android/arm64-v8a android/x86 android/x86_64

./Configure android-arm $BASE_ARGS -D__ANDROID_API__=21
make clean
make build_libs -j$PARALLEL_JOBS
cp libcrypto.a libssl.a android/armeabi-v7a/

./Configure android-arm64 $BASE_ARGS -D__ANDROID_API__=21
make clean
make build_libs -j$PARALLEL_JOBS
cp libcrypto.a libssl.a android/arm64-v8a/

./Configure android-x86 $BASE_ARGS -D__ANDROID_API__=21
make clean
make build_libs -j$PARALLEL_JOBS
cp libcrypto.a libssl.a android/x86/

./Configure android-x86_64 $BASE_ARGS -D__ANDROID_API__=21
make clean
make build_libs -j$PARALLEL_JOBS
cp libcrypto.a libssl.a android/x86_64/

mkdir -p android/include
cp -R include/openssl android/include/

# Clean up in-tree build
git reset --hard
git clean -f -d -x -e android

popd
