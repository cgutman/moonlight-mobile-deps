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

7z a moonlight-android-deps.zip ./output/*