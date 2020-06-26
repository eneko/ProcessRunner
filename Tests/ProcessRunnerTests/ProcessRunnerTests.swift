import XCTest
import ProcessRunner

final class ProcessRunnerTests: XCTestCase {

    func testWhich() throws {
        let result = try ProcessRunner(command: "/usr/bin/env", arguments: ["which", "which"],
                                       captureOutput: true).run()
        XCTAssertEqual(result.standardOutput, "/usr/bin/which")
    }

    func testShell() throws {
        let result = try ProcessRunner(command: "/usr/bin/env", arguments: ["which", "sh"],
                                       captureOutput: true).run()
        XCTAssertEqual(result.standardOutput, "/bin/sh")
    }
}
