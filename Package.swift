// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Omnia",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Omnia",
            targets: ["Omnia"]),
    ],
    targets: [
        .target(
            name: "Omnia",
            path: "Sources"
        ),
        .testTarget(
            name: "OmniaTests",
            dependencies: ["Omnia"]),
    ],
    swiftLanguageVersions: [.v5]
)
