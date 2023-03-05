// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Test",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .watchOS(.v7),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "Test",
            targets: ["Test"]),
    ],
    dependencies: [
        .package(url: "https://github.com/0xOpenBytes/t", from: "1.0.0"),
        .package(url: "https://github.com/0xLeif/Scribe", from: "1.3.0"),
        .package(url: "https://github.com/0xLeif/Plugin", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "Test",
            dependencies: [
                "t",
                "Scribe",
                "Plugin"
            ]
        ),
        .testTarget(
            name: "TestTests",
            dependencies: ["Test"]
        )
    ]
)
