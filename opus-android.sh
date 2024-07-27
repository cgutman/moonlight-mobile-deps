ANDROID_API_TARGET=21
PARALLEL_JOBS=$(nproc)
TOOLCHAIN_DIR=llvm
TOOLCHAIN_PLATFORM=linux-x86_64

pushd opus

rm -r ./android
mkdir android

set -e

function build_one
{
TOOLCHAIN_PATH=$NDK/toolchains/$TOOLCHAIN_DIR/prebuilt/$TOOLCHAIN_PLATFORM
export PATH=$PATH:$TOOLCHAIN_PATH/bin
export CC=$TOOLCHAIN_BIN_PREFIX-clang
export CXX=$TOOLCHAIN_BIN_PREFIX-clang++
./autogen.sh
./configure \
    --prefix=$(pwd)/android/$CPU \
    --build=x86_64-unknown-linux-gnu \
    --host=$TOOLCHAIN_BIN_PREFIX \
    --target=$TOOLCHAIN_BIN_PREFIX \
    --disable-shared --enable-static --with-pic --disable-extra-programs --disable-doc \
    $ADDI_CONFIGURE_FLAGS
make clean
make -j$PARALLEL_JOBS
make install
}

function build_x86
{
CPU=x86
SYSROOT_CPU=x86
TOOLCHAIN_BIN_PREFIX=i686-linux-android$ANDROID_API_TARGET
ADDI_CONFIGURE_FLAGS=""
build_one
}

function build_x86_64
{
CPU=x86_64
SYSROOT_CPU=x86_64
TOOLCHAIN_BIN_PREFIX=x86_64-linux-android$ANDROID_API_TARGET
ADDI_CONFIGURE_FLAGS=""
build_one
}

function build_armv7
{
CPU=armeabi-v7a
SYSROOT_CPU=arm
TOOLCHAIN_BIN_PREFIX=armv7a-linux-androideabi$ANDROID_API_TARGET
ADDI_CONFIGURE_FLAGS=""
build_one
}

function build_armv8
{
CPU=arm64-v8a
SYSROOT_CPU=arm64
TOOLCHAIN_BIN_PREFIX=aarch64-linux-android$ANDROID_API_TARGET
ADDI_CONFIGURE_FLAGS=""
build_one
}

build_x86
build_x86_64
build_armv7
build_armv8

popd