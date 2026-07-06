// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AIProductIOSTemplate",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "AIProductIOSTemplate",
            targets: ["AIProductIOSTemplate"]
        )
    ],
    targets: [
        .target(
            name: "AIProductIOSTemplate",
            path: "Sources/App"
        ),
        .testTarget(
            name: "AIProductIOSTemplateTests",
            dependencies: ["AIProductIOSTemplate"],
            path: "Tests"
        )
    ]
)
