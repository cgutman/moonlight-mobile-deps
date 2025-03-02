set -e

./opus-apple.sh arm64 iphoneos ios
./opus-apple.sh arm64 iphonesimulator ios-simulator
./opus-apple.sh x86_64 iphonesimulator ios-simulator
./opus-apple.sh arm64 appletvos tvos
./opus-apple.sh arm64 appletvsimulator tvos-simulator
./opus-apple.sh x86_64 appletvsimulator tvos-simulator
./FFmpeg.sh arm64 iphoneos ios
./FFmpeg.sh arm64 iphonesimulator ios-simulator
./FFmpeg.sh x86_64 iphonesimulator ios-simulator
./FFmpeg.sh arm64 appletvos tvos
./FFmpeg.sh arm64 appletvsimulator tvos-simulator
./FFmpeg.sh x86_64 appletvsimulator tvos-simulator
./SDL-ios.sh
./SDL-tvos.sh