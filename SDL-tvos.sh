set -e

# Build tvOS and tvOS simulator builds
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Static Library-tvOS' -configuration Release -sdk appletvos build
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Static Library-tvOS' -configuration Release -sdk appletvsimulator build

# Print initial fat binary data
lipo -info SDL/Xcode/SDL/build/Release-appletvos/libSDL3.a
lipo -info SDL/Xcode/SDL/build/Release-appletvsimulator/libSDL3.a
