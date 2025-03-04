set -e

# Build xcframework
xcodebuild -project SDL/Xcode/SDL/SDL.xcodeproj -target 'SDL3.xcframework' -configuration Release
