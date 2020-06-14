import Foundation

/// Process runner to execute system commands
public class ProcessRunner {
    public let command: String
    public let arguments: [String]
    public let captureOutput: Bool
    public let currentDirectoryPath: String?

    /// Initialize process runner
    /// - Parameters:
    ///   - command: Absolute path to the binary executable
    ///   - arguments: List of arguments to pass to the executable
    ///   - captureOutput: Capture stdout and stderr
    ///   - currentDirectoryPath: Specify current directory for child process (optional)
    public init(command: String, arguments: [String], captureOutput: Bool, currentDirectoryPath: String? = nil) {
        self.command = command
        self.arguments = arguments
        self.captureOutput = captureOutput
        self.currentDirectoryPath = currentDirectoryPath
    }

    /// Execute the process
    /// - Throws: Throws error if process fails to run
    /// - Returns: Process execution result, including status code and captured output
    public func run() throws -> ProcessResult {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: command)
        process.arguments = arguments

        if let path = currentDirectoryPath {
            process.currentDirectoryURL = URL(fileURLWithPath: path)
        }

        let outputPipe = Pipe()
        let errorPipe = Pipe()
        if captureOutput {
            process.standardOutput = outputPipe
            process.standardError = errorPipe
        }

        try process.run()
        process.waitUntilExit()

        let standardOutput = captureOutput ? outputPipe.string ?? "" : ""
        let standardError = captureOutput ? errorPipe.string ?? "" : ""
        return ProcessResult(exitStatus: Int(process.terminationStatus),
                             standardOutput: standardOutput, standardError: standardError)
    }
}

extension Pipe {
    var string: String? {
        let data = fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8)?
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
