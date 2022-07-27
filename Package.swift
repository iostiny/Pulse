// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Pulse",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v11),
        .watchOS(.v7)
    ],
    products: [
        .library(name: "Pulse", targets: ["Pulse"]),
        .library(name: "PulseCore", targets: ["PulseCore"]),
        .library(name: "PulseUI", targets: ["PulseUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.2.0")
    ],
    targets: [
        .target(name: "PulseUI", dependencies: ["PulseCore"]),
        .target(name: "Pulse", dependencies: [.product(name: "Logging", package: "swift-log"), "PulseCore"]),
        .target(name: "PulseCore"),
        .testTarget(name: "PulseTests", dependencies: ["Pulse"], resources: [.process("Resources")]),
        .testTarget(name: "PulseUITests", dependencies: ["PulseCore", "PulseUI"])
    ]
)
