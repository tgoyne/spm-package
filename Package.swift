// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Wrapper",
    products: [
        .library(
            name: "Wrapper",
            targets: ["Wrapper"]),
    ],
    targets: [
        .binaryTarget(
            name: "TestLibrary",
            url: "https://github.com/tgoyne/spm-package/raw/master/TestLibrary/TestLibrary.xcframework.zip",
            checksum: "b0f8b5cb0a7f7342e05168b2efe9bb8a7936f97b8d627d31d52292f2466ffc65"
        ),
        .target(
            name: "Wrapper",
            dependencies: ["TestLibrary"]),
        .testTarget(
            name: "WrapperTests",
            dependencies: ["Wrapper"]),
    ]
)
