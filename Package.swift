// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "GenLint Plugin Package",
    products: [
        .plugin(
            name: "SwiftLintPlugin",
            targets: ["SwiftLintPlugin"]
        ),
    ],
    targets: [
        // Binaries
        .binaryTarget(
            name: "SwiftLintBinary",
            path: "Binaries/SwiftLintBinary.artifactbundle"
        ),

        // Plugins
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool(),
            dependencies: [
                "SwiftLintBinary",
            ]
        ),
    ]
)
