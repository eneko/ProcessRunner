// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "ProcessRunner",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(name: "ProcessRunner", targets: ["ProcessRunner"])
    ],
    targets: [
        .target(name: "ProcessRunner", dependencies: []),
        .testTarget(name: "ProcessRunnerTests", dependencies: ["ProcessRunner"])
    ]
)
