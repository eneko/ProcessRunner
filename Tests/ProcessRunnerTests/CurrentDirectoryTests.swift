import XCTest
import ProcessRunner

final class CurrentDirectoryTests: XCTestCase {

    func testCurrentDirectory() throws {
        XCTAssertEqual(try system(command: "pwd", captureOutput: true, currentDirectoryPath: "/").standardOutput, "/")
    }

    func testCurrentDirectoryCommand() throws {
        let content = UUID().uuidString
        try content.write(toFile: "/tmp/foo-command", atomically: true, encoding: .utf8)

        XCTAssertEqual(try system(command: "cat /tmp/foo-command", captureOutput: true).standardOutput, content)
        XCTAssertEqual(try system(command: "cat foo-command", captureOutput: true,
                                  currentDirectoryPath: "/tmp").standardOutput, content)
    }

    func testCurrentDirectoryShell() throws {
        let content = UUID().uuidString
        try content.write(toFile: "/tmp/foo-shell", atomically: true, encoding: .utf8)

        XCTAssertEqual(try system(shell: "cat /tmp/foo-shell", captureOutput: true).standardOutput, content)
        XCTAssertEqual(try system(shell: "cat foo-shell", captureOutput: true,
                                  currentDirectoryPath: "/tmp").standardOutput, content)
    }

}
