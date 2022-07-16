// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "GenLint Plugin Package",
    products: [
        .plugin(
            name: "SwiftGenPlugin",
            targets: ["SwiftGenPlugin"]
        ),
        .plugin(
            name: "SwiftLintPlugin",
            targets: ["SwiftLintPlugin"]
        ),
    ],
    targets: [
        // Binaries
        .binaryTarget(
            name: "SwiftGenBinary",
            path: "Binaries/SwiftGenBinary.artifactbundle"
        ),
        .binaryTarget(
            name: "SwiftLintBinary",
            path: "Binaries/SwiftLintBinary.artifactbundle"
        ),

        // Plugins
        .plugin(
            name: "SwiftGenPlugin",
            capability: .buildTool(),
            dependencies: [
                "SwiftGenBinary"
            ]
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool(),
            dependencies: [
                "SwiftLintBinary",
            ]
        ),
    ]
)
