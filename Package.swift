// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "GenLint Plugin Package",
    products: [
        .plugin(
            name: "SwiftGenPlugin",
            targets: ["SwiftGenPlugin"]
        ),
    ],
    targets: [
        // Binaries
        .binaryTarget(
            name: "SwiftGenBinary",
            path: "Binaries/SwiftGenBinary.artifactbundle"
        ),

        // Plugins
        .plugin(
            name: "SwiftGenPlugin",
            capability: .buildTool(),
            dependencies: [
                "SwiftGenBinary"
            ]
        ),
    ]
)
