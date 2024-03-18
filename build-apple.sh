set -e

./opus-apple.sh arm64 iphoneos ios arm-apple-darwin
./opus-apple.sh arm64 iphonesimulator ios-simulator arm-apple-darwin
./opus-apple.sh x86_64 iphonesimulator ios-simulator x86_64-apple-darwin
./opus-apple.sh arm64 appletvos tvos arm-apple-darwin
./opus-apple.sh arm64 appletvsimulator tvos-simulator arm-apple-darwin
./opus-apple.sh x86_64 appletvsimulator tvos-simulator x86_64-apple-darwin
./FFmpeg.sh arm64 iphoneos ios
./FFmpeg.sh arm64 iphonesimulator ios-simulator
./FFmpeg.sh x86_64 iphonesimulator ios-simulator
./FFmpeg.sh arm64 appletvos tvos
./FFmpeg.sh arm64 appletvsimulator tvos-simulator
./FFmpeg.sh x86_64 appletvsimulator tvos-simulator
./SDL-ios.sh
./SDL-tvos.sh