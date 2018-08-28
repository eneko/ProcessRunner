import Foundation
import Basic

extension ProcessResult {

    /// Returns `true` if the process finalized with exit code 0.
    /// Returns `false` if the process finished with any non-zero
    /// exit code or if it was terminated with a signal.
    public var success: Bool {
        switch exitStatus {
        case let .terminated(code) where code == 0:
            return true
        default:
            return false
        }
    }

    /// Captured UTF8 standard output, if any.
    public var standardOutput: String {
        let utf8 = try? utf8Output()
        return utf8?.trimmingCharacters(in: .newlines) ?? ""
    }

    /// Captured UTF8 error output, if any.
    public var standardError: String {
        let utf8 = try? utf8stderrOutput()
        return utf8?.trimmingCharacters(in: .newlines) ?? ""
    }

}
