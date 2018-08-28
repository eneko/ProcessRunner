import XCTest
import System

final class StandardErrorTests: XCTestCase {

    func testStandardError() throws {
        XCTAssertTrue(try system(command: "cat --foobar", captureOutput: true).standardError.contains("illegal option"))
    }

    func testStandardErrorShell() throws {
        XCTAssertTrue(try system(shell: "cat --foobar", captureOutput: true).standardError.contains("illegal option"))
    }

    static var allTests = [
        ("testStandardError", testStandardError),
        ("testStandardErrorShell", testStandardErrorShell),
    ]
}
