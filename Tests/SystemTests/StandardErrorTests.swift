import XCTest
import System

final class StandardErrorTests: XCTestCase {

    var expectedError: String {
      #if os(Linux)
        return "cat: unrecognized option"
      #else
        return "cat: illegal option"
      #endif
    }

    func testStandardError() throws {
        XCTAssertTrue(try system(command: "cat --foobar", captureOutput: true).standardError.contains(expectedError))
    }

    func testStandardErrorShell() throws {
        XCTAssertTrue(try system(shell: "cat --foobar", captureOutput: true).standardError.contains(expectedError))
    }

    static var allTests = [
        ("testStandardError", testStandardError),
        ("testStandardErrorShell", testStandardErrorShell),
    ]
}
