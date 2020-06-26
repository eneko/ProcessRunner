import XCTest
import ProcessRunner

final class StandardOutputTests: XCTestCase {

    func testEchoCombined() throws {
        XCTAssertEqual(try system(command: "echo hello world", captureOutput: true).standardOutput, "hello world")
    }

    func testEchoSplit() throws {
        let output = try system(command: "echo", parameters: ["hello", "world"], captureOutput: true).standardOutput
        XCTAssertEqual(output, "hello world")
    }

    func testEchoEscaping() throws {
        let output = try system(command: "echo", parameters: ["hello world"], captureOutput: true).standardOutput
        XCTAssertEqual(output, "hello world")
    }

    func testPipe() throws {
        let output = try system(command: "echo hello cat | cat", captureOutput: true).standardOutput
        XCTAssertEqual(output, "hello cat | cat")
    }

    func testRedirect() throws {
        let output = try system(command: "echo hello cat > cat && cat cat", captureOutput: true).standardOutput
        XCTAssertEqual(output, "hello cat > cat && cat cat")
    }

    func testShell() throws {
        let path = try system(command: "sh -c pwd", captureOutput: true).standardOutput
        let parent = try system(command: "sh", parameters: ["-c", "cd .. && pwd"], captureOutput: true).standardOutput
        XCTAssertNotEqual(path, parent)
        XCTAssertTrue(path.hasPrefix(parent))
    }

    func testShellPipe() throws {
        let output = try system(command: "sh", "-c", "echo foo bar | awk '{print $2}'",
                                captureOutput: true).standardOutput
        XCTAssertEqual(output, "bar")
    }

    func testShellRedirect() throws {
        let result = try system(shell: "echo hello cat > cat && cat cat && rm cat", captureOutput: true)
        XCTAssertEqual(result.standardOutput, "hello cat")
    }

    func testShellRedirectPipe() throws {
        let output = try system(shell: "echo hello cat > cat && cat cat | awk '{print $2}' && rm cat",
                                captureOutput: true).standardOutput
        XCTAssertEqual(output, "cat")
    }

    func testNoStandardOutput() throws {
        XCTAssertEqual(try system(command: "cat --foobar", captureOutput: true).standardOutput, "")
    }
}
