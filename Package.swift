// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SLRMDMConfig",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        .library(
            name: "SLRMDMConfig", targets: ["SLRMDMConfig"]
        )
    ],
    targets: [
        .target(
            name: "SLRMDMConfig",
            path: ".",
            sources: ["SLRMDMConfig"],
            publicHeadersPath: "SLRMDMConfig"
        ),
        .testTarget(
            name: "SLRMDMConfigTests",
            dependencies: ["SLRMDMConfig"],
            path: ".",
            sources: ["SLRMDMConfigTests"]
        )
    ]
)
