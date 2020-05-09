import Foundation

/// Executes command with parameters as a child process
///
/// `system` will wait for the process to finish, blocking the current thread.
///
/// - Parameters:
///   - command: Command to execute (full binary path or name of executable in $PATH).
///   - parameters: List of parameters to pass to the command.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///                    the return object. Otherwise, process output will be forwarded to stdout and stderr.
///                    Defaults to `false`.
///   - currentDirectoryPath: Specify current directory for child process (optional)
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(command: String, parameters: [String], captureOutput: Bool = false,
                   currentDirectoryPath: String? = nil) throws -> ProcessResult {
    let executablePath = /*command.hasPrefix("/") ? command :*/ try which(program: command)
    return try ProcessRunner(command: executablePath, arguments: parameters,
                             captureOutput: captureOutput,
                             currentDirectoryPath: currentDirectoryPath).run()
}

// MARK: Process helpers

/// Executes command with parameters as a child process
///
/// `system` will wait for the process to finish, blocking the current thread.
///
/// - Parameters:
///   - command: Command to execute (full binary path or name of executable in $PATH) and list of parameters, if any.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///                    the return object. Otherwise, process output will be forwarded to stdout and stderr.
///                    Defaults to `false`.
///   - currentDirectoryPath: Specify current directory for child process (optional)
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(command: [String], captureOutput: Bool = false,
                   currentDirectoryPath: String? = nil) throws -> ProcessResult {
    guard let executable = command.first else {
        throw SystemError.missingCommand
    }
    return try system(command: executable, parameters: Array(command[1...]),
                      captureOutput: captureOutput, currentDirectoryPath: currentDirectoryPath)
}

/// Executes command with parameters as a child process
///
/// `system` will wait for the process to finish, blocking the current thread.
///
/// - Parameters:
///   - command: Command to execute (full binary path or name of executable in $PATH) and list of parameters.
///              Parameters will be split by spaces.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///                    the return object. Otherwise, process output will be forwarded to stdout and stderr.
///                    Defaults to `false`.
///   - currentDirectoryPath: Specify current directory for child process (optional)
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(command: String, captureOutput: Bool = false,
                   currentDirectoryPath: String? = nil) throws -> ProcessResult {
    return try system(command: command.split(separator: " ").map(String.init),
                      captureOutput: captureOutput, currentDirectoryPath: currentDirectoryPath)
}

/// Executes command with parameters as a child process
///
/// `system` will wait for the process to finish, blocking the current thread.
///
/// - Parameters:
///   - command: Command to execute (full binary path or name of executable in $PATH) and list of parameters, if any.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///                    the return object. Otherwise, process output will be forwarded to stdout and stderr.
///                    Defaults to `false`.
///   - currentDirectoryPath: Specify current directory for child process (optional)
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(command: String..., captureOutput: Bool = false,
                   currentDirectoryPath: String? = nil) throws -> ProcessResult {
    return try system(command: command, captureOutput: captureOutput, currentDirectoryPath: currentDirectoryPath)
}

// MARK: - Shell helpers

/// Executes command with parameters in a subshell
///
/// `system` will wait for the shell process to finish, blocking the current thread.
///
/// - Parameters:
///   - shell: Shell command with parameters to execute in a subshell with `sh -c`.
///   - captureOutput: If output is captured, both stdout and strerr will be available in
///                    the return object. Otherwise, process output will be forwarded to stdout and stderr.
///                    Defaults to `false`.
///   - currentDirectoryPath: Specify current directory for child process (optional)
/// - Returns: Process result data which is available after process termination.
///   The `ProcessResult` object includes exit code or termination signal and any captured output.
/// - Throws: `SystemError.waitpid` if process execution failed.
@discardableResult
public func system(shell: String, captureOutput: Bool = false,
                   currentDirectoryPath: String? = nil) throws -> ProcessResult {
    return try system(command: "/bin/sh", parameters: ["-c", shell],
                      captureOutput: captureOutput, currentDirectoryPath: currentDirectoryPath)
}

// MARK: - Other helpers

enum SystemError: Error {
    case missingCommand
}

func which(program: String) throws -> String {
    let result = try ProcessRunner(command: "/usr/bin/env", arguments: ["which", program], captureOutput: true).run()
    return result.standardOutput
}
