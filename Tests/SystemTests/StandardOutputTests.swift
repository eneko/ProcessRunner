import XCTest
import System

final class StandardOutputTests: XCTestCase {

    func testEchoCombined() throws {
        XCTAssertEqual(try system(command: "echo hello world", captureOutput: true).standardOutput, "hello world")
    }

    func testEchoSplit() {
        XCTAssertEqual(try system(command: "echo", parameters: ["hello", "world"], captureOutput: true).standardOutput, "hello world")
    }

    func testEchoEscaping() {
        XCTAssertEqual(try system(command: "echo", parameters: ["hello world"], captureOutput: true).standardOutput, "hello world")
    }

    func testPipe() throws {
        XCTAssertEqual(try system(command: "echo hello cat | cat", captureOutput: true).standardOutput, "hello cat | cat")
    }

    func testRedirect() throws {
        XCTAssertEqual(try system(command: "echo hello cat > cat && cat cat", captureOutput: true).standardOutput, "hello cat > cat && cat cat")
    }

    func testShell() throws {
        let path = try system(command: "sh -c pwd", captureOutput: true).standardOutput
        let parent = try system(command: "sh", parameters: ["-c", "cd .. && pwd"], captureOutput: true).standardOutput
        XCTAssertNotEqual(path, parent)
        XCTAssertTrue(path.hasPrefix(parent))
    }

    func testShellPipe() throws {
        XCTAssertEqual(try system(command: "sh", "-c", "echo foo bar | awk '{print $2}'", captureOutput: true).standardOutput, "bar")
    }

    func testShellRedirect() throws {
        XCTAssertEqual(try system(shell: "echo hello cat > cat && cat cat", captureOutput: true).standardOutput, "hello cat")
    }

    func testShellRedirectPipe() throws {
        XCTAssertEqual(try system(shell: "echo hello cat > cat && cat cat | awk '{print $2}'", captureOutput: true).standardOutput, "cat")
    }

    func testNoStandardOutput() throws {
        XCTAssertEqual(try system(command: "cat --foobar", captureOutput: true).standardOutput, "")
    }
}
