import Foundation
import Basic

@discardableResult
public func system(command: String, captureOutput: Bool = false) throws -> ProcessResult {
    var parameters = command.split(separator: " ").map(String.init)
    let command = parameters.removeFirst()
    return try system(command: command, parameters: parameters, captureOutput: captureOutput)
}

@discardableResult
public func system(command: String..., captureOutput: Bool = false) throws -> ProcessResult {
    return try system(commands: command, captureOutput: captureOutput)
}

@discardableResult
public func system(command: String, parameters: [String], captureOutput: Bool = false) throws -> ProcessResult {
    return try system(commands: [command] + parameters, captureOutput: captureOutput)
}

/// Executes command with parameters in a subshell
///
/// `system` will wait for the process to finish, blocking the current thread.
///
/// - Parameters:
///   - command: Command to execute
///   - parameters: String list of parameters to pass to the command
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///     the return object. Otherwise, process output will be forwarded to stdout and stderr.
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if waiting for the child process to finish failed.
@discardableResult
public func system(commands: [String], captureOutput: Bool = false) throws -> ProcessResult {
    let process = Basic.Process(arguments: commands, redirectOutput: captureOutput)
    try process.launch()
    let result = try process.waitUntilExit()
    return result
}


extension ProcessResult {

    public var success: Bool {
        switch exitStatus {
        case .signalled:
            return false
        case let .terminated(code):
            return code == 0
        }
    }

    public var standardOutput: String {
        let utf8 = try? utf8Output()
        return utf8?.trimmingCharacters(in: .newlines) ?? ""
    }

    public var standardError: String {
        let utf8 = try? utf8stderrOutput()
        return utf8?.trimmingCharacters(in: .newlines) ?? ""
    }
}
