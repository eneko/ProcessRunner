import Foundation
import Basic

/// Executes command with parameters as a child process
///
/// `system` will wait for the process to finish, blocking the current thread.
///
/// - Parameters:
///   - command: Command to execute and list of parameters, if any.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///     the return object. Otherwise, process output will be forwarded to stdout and stderr.
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(command: [String], captureOutput: Bool = false) throws -> ProcessResult {
    let process = Basic.Process(arguments: command, redirectOutput: captureOutput)
    try process.launch()
    let result = try process.waitUntilExit()
    return result
}

// MARK: Process helpers

/// Executes command with parameters as a child process
///
/// `system` will wait for the process to finish, blocking the current thread.
///
/// - Parameters:
///   - command: Command to execute and list of parameters, if any. Parameters will be split by spaces.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///     the return object. Otherwise, process output will be forwarded to stdout and stderr.
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(command: String, captureOutput: Bool = false) throws -> ProcessResult {
    var parameters = command.split(separator: " ").map(String.init)
    let command = parameters.removeFirst()
    return try system(command: command, parameters: parameters, captureOutput: captureOutput)
}

/// Executes command with parameters as a child process
///
/// `system` will wait for the process to finish, blocking the current thread.
///
/// - Parameters:
///   - command: Command to execute and list of parameters, if any.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///     the return object. Otherwise, process output will be forwarded to stdout and stderr.
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(command: String..., captureOutput: Bool = false) throws -> ProcessResult {
    return try system(command: command, captureOutput: captureOutput)
}

/// Executes command with parameters as a child process
///
/// `system` will wait for the process to finish, blocking the current thread.
///
/// - Parameters:
///   - command: Command to execute.
///   - parameters: List of parameters to pass to the command.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///     the return object. Otherwise, process output will be forwarded to stdout and stderr.
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(command: String, parameters: [String], captureOutput: Bool = false) throws -> ProcessResult {
    return try system(command: [command] + parameters, captureOutput: captureOutput)
}

// MARK: Shell helpers

/// Executes command with parameters in a subshell
///
/// `system` will wait for the shell process to finish, blocking the current thread.
///
/// - Parameters:
///   - shell: Shell command with parameters to execute in a subshell with `sh -c`.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///     the return object. Otherwise, process output will be forwarded to stdout and stderr.
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(shell: String, captureOutput: Bool = false) throws -> ProcessResult {
    return try system(command: "sh", parameters: ["-c", shell], captureOutput: captureOutput)
}
