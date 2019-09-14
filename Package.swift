// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "System",
    products: [
        .library(name: "System", targets: ["System"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "System", dependencies: ["SwiftPM"]),
        .testTarget(name: "SystemTests", dependencies: ["System"]),
    ]
)
