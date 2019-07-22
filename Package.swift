// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "XYColor",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(name: "XYColor", targets: ["XYColor"])
    ],
    targets: [
        .target(name: "XYColor")
    ]
)
