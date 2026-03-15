// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var swiftSettings: [SwiftSetting] = [
    .define("SQLITE_HAS_CODEC"),
    .define("GRDBCIPHER"),
    .define("SQLITE_ENABLE_FTS5")
]

var cSettings: [CSetting] = [
    .define("SQLITE_HAS_CODEC", to: "1"),
    .define("GRDBCIPHER", to: "1"),
    .define("SQLITE_ENABLE_FTS5", to: "1")
]

let package = Package(
    name: "GRDB",
    products: [
        .library(
            name: "GRDB",
            targets: ["GRDB"]),
    ],
    dependencies: [
        // rac-Shiraishi/SQLCipher: SQLite 3.50.4 (CVE-2025-6965 fix), SQLITE_DEBUG + LOAD_EXTENSION removed
        .package(url: "https://github.com/rac-Shiraishi/SQLCipher", exact: "1.1.0")
    ],
    targets: [
        .target(
            name: "GRDB",
            dependencies: ["SQLCipher"],
            cSettings: cSettings,
            swiftSettings: swiftSettings)
    ]
)
