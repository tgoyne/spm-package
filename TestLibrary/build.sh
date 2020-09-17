#!/bin/bash

$(xcrun --sdk iphoneos --find clang) -isysroot $(xcrun --sdk iphoneos --show-sdk-path) -target arm64-apple-ios11.0 -fembed-bitcode src/TestLibrary.cpp -Iinclude -c -o device.o
$(xcrun --sdk iphonesimulator --find clang) -isysroot $(xcrun --sdk iphonesimulator --show-sdk-path) src/TestLibrary.cpp -Iinclude -c -o simulator.o
ar cr device.a device.o
ar cr simulator.a simulator.o
xcodebuild -create-xcframework \
  -library simulator.a -headers include \
  -library device.a -headers include \
  -output TestLibrary.xcframework
zip -r TestLibrary.xcframework.zip TestLibrary.xcframework
swift package compute-checksum TestLibrary.xcframework.zip
