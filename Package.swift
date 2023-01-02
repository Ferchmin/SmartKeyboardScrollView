// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SmartKeyboardScrollView",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "SmartKeyboardScrollView", targets: ["SmartKeyboardScrollView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SmartKeyboardScrollView",
            dependencies: [])
    ]
)
