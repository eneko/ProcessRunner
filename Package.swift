// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "System",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(name: "System", targets: ["System"]),
    ],
    targets: [
        .target(name: "System", dependencies: []),
        .testTarget(name: "SystemTests", dependencies: ["System"]),
    ]
)
