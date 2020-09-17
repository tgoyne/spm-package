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
            checksum: "f8f479aaca2e1b62f6bc1bd2291d4f6144a1dd438764b3661888e8b8601c9b5c"
        ),
        .target(
            name: "Wrapper",
            dependencies: ["TestLibrary"]),
        .testTarget(
            name: "WrapperTests",
            dependencies: ["Wrapper"]),
    ]
)
