set -e

mkdir output
mkdir output/SDL2
mkdir output/SDL2/include
mkdir output/SDL2/lib
mkdir output/SDL2/lib/iOS
mkdir output/SDL2/lib/tvOS

cp SDL/include/*.h output/SDL2/include

lipo SDL/Xcode/SDL/build/Release-iphone*/libSDL2.a -create -o output/SDL2/lib/iOS/libSDL2.a
lipo SDL/Xcode/SDL/build/Release-appletv*/libSDL2.a -create -o output/SDL2/lib/tvOS/libSDL2.a

lipo -info output/SDL2/lib/iOS/libSDL2.a
lipo -info output/SDL2/lib/tvOS/libSDL2.a

7z a moonlight-ios-deps.zip ./output/*