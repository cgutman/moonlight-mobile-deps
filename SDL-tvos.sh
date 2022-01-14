set -e

# Build tvOS and tvOS simulator builds
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Static Library-tvOS' -configuration Release -sdk appletvos build
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'Static Library-tvOS' -configuration Release -sdk appletvsimulator build

# Print initial fat binary data
lipo -info SDL/Xcode/SDL/build/Release-appletvos/libSDL2.a
lipo -info SDL/Xcode/SDL/build/Release-appletvsimulator/libSDL2.a

# Strip the arm64 platform from the simulator version before we combine them during archiving
lipo SDL/Xcode/SDL/build/Release-appletvsimulator/libSDL2.a -remove arm64 -o SDL/Xcode/SDL/build/Release-appletvsimulator/libSDL2.a
