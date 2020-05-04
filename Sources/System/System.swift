import Foundation

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
    guard let executablePath = try which(program: command) else {
        throw SystemError.binaryNotFound(program: command)
    }
    return try ProcessRunner(command: executablePath, arguments: parameters,
                             captureOutput: captureOutput).run()
}

// MARK: Process helpers

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
    guard let executable = command.first else {
        throw SystemError.missingCommand
    }
    return try system(command: executable, parameters: Array(command[1...]),
                      captureOutput: captureOutput)
}

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
    return try system(command: command.split(separator: " ").map(String.init), captureOutput: captureOutput)
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

// MARK: - Shell helpers

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
    return try system(command: "/bin/sh", parameters: ["-c", shell], captureOutput: captureOutput)
}

// MARK: - Other helpers

enum SystemError: Error {
    case missingCommand
    case binaryNotFound(program: String)
}

func which(program: String) throws -> String? {
    let result = try ProcessRunner(command: "/usr/bin/env", arguments: ["which", program], captureOutput: true).run()
    guard FileManager.default.isExecutableFile(atPath: result.standardOutput) else {
        return nil
    }
    return result.standardOutput
}
