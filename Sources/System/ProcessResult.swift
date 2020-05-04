import Foundation

/// Process result, including captured output if required
public struct ProcessResult {
    /// Process exit status code
    public let exitStatus: Int

    /// Standard output, if captured
    public let standardOutput: String

    /// Standard error output, if captured
    public let standardError: String

    /// Returns `true` if the process finalized with exit code 0.
    public var success: Bool {
        return exitStatus  == 0
    }
}
