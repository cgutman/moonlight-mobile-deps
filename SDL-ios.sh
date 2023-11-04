set -e

# Build iOS and iOS simulator builds
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Static Library-iOS' -configuration Release -sdk iphoneos build
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Static Library-iOS' -configuration Release -sdk iphonesimulator build

# Print initial fat binary data
lipo -info SDL/Xcode/SDL/build/Release-iphoneos/libSDL2.a
lipo -info SDL/Xcode/SDL/build/Release-iphonesimulator/libSDL2.a
