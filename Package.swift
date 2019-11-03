// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "System",
    products: [
        .library(name: "System", targets: ["System"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager.git", .exact("0.4.0")),
    ],
    targets: [
        .target(name: "System", dependencies: ["SwiftPM"]),
        .testTarget(name: "SystemTests", dependencies: ["System"]),
    ]
)
