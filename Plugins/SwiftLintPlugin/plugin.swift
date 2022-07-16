import PackagePlugin

@main
struct SwiftLintBuildToolPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let swiftlint = try context.tool(named: "swiftlint")

        return [
            .buildCommand(
                displayName: "Linting \(target.name)",
                executable: swiftlint.path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit", 
                    "--path",
                    target.directory.string, 
                ],
                environment: [:]
            ),
        ]
    }
}
