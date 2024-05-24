// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let swiftSettings: [SwiftSetting] = [
	.enableExperimentalFeature("StrictConcurrency")
]

let package = Package(
    name: "SharedStateSendability",
	platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SharedStateSendability",
            targets: ["SharedStateSendability"]),
    ],
	dependencies: [
		.package(
			url: "https://github.com/pointfreeco/swift-composable-architecture",
			from: "1.10.4"),
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
			name: "SharedStateSendability",
			dependencies: [
				.product(
					name: "ComposableArchitecture",
					package: "swift-composable-architecture"),
			],
			swiftSettings: swiftSettings
		),
        .testTarget(
            name: "SharedStateSendabilityTests",
            dependencies: ["SharedStateSendability"]),
    ]
)
