// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CelestialCascade",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "CelestialCascade",
            targets: ["CelestialCascade"]
        ),
    ],
    dependencies: [
        // The Composable Architecture for state management
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.0.0"
        ),
        // Swift Collections for efficient data structures
        .package(
            url: "https://github.com/apple/swift-collections",
            from: "1.0.0"
        ),
    ],
    targets: [
        .target(
            name: "CelestialCascade",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Collections", package: "swift-collections"),
            ]
        ),
        .testTarget(
            name: "CelestialCascadeTests",
            dependencies: ["CelestialCascade"]
        ),
    ]
)