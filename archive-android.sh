set -e

mkdir output

mkdir output/opus
mkdir output/opus/include
mkdir output/opus/arm64-v8a
mkdir output/opus/armeabi-v7a
mkdir output/opus/x86
mkdir output/opus/x86_64

cp opus/android/arm64-v8a/include/opus/* output/opus/include
cp opus/android/arm64-v8a/lib/libopus.a output/opus/arm64-v8a
cp opus/android/armeabi-v7a/lib/libopus.a output/opus/armeabi-v7a
cp opus/android/x86/lib/libopus.a output/opus/x86
cp opus/android/x86_64/lib/libopus.a output/opus/x86_64

mkdir output/openssl
mkdir output/openssl/arm64-v8a
mkdir output/openssl/armeabi-v7a
mkdir output/openssl/x86
mkdir output/openssl/x86_64

# We only need libcrypto for Moonlight
cp -R openssl/android/include output/openssl/
cp openssl/android/arm64-v8a/libcrypto.a output/openssl/arm64-v8a
cp openssl/android/armeabi-v7a/libcrypto.a output/openssl/armeabi-v7a
cp openssl/android/x86/libcrypto.a output/openssl/x86
cp openssl/android/x86_64/libcrypto.a output/openssl/x86_64

pushd output
zip -r -y ../moonlight-android-deps.zip *
popd