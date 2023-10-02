import Foundation
import PackagePlugin

@main
struct SwiftGenBuildToolPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let swiftgen = try context.tool(named: "swiftgen")
        let config = context.package.directory.appending(".swiftgen.yml")
        let output = outputPath(for: context)

        return [
            .prebuildCommand(
                displayName: "Running \(swiftgen.name)",
                executable: swiftgen.path,
                arguments: [
                    "config",
                    "run",
                    "--config", config
                ],
                environment: [
                    "PROJECT_DIR": context.package.directory,
                    "TARGET_NAME": target.name,
                    "DERIVED_SOURCES_DIR": output,
                ],
                outputFilesDirectory: output
            )
        ]
    }

    private func outputPath(for context: PluginContext) -> Path {
        switch isXcodeCloudEnvironment {
        case true:
            return Path("/Volumes/workspace/DerivedData/SourcePackages/plugins")

        default:
            return context.pluginWorkDirectory
        }
    }

    private var isXcodeCloudEnvironment: Bool {
        ProcessInfo().environment["CI_XCODE_CLOUD"] == "TRUE"
    }
}
