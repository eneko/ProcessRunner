import XCTest
import ProcessRunner

final class SuccessFailureTests: XCTestCase {

    func testSuccess() throws {
        XCTAssertTrue(try system(shell: "echo foo bar").success)
    }

    func testFailure() throws {
        XCTAssertFalse(try system(shell: "echoooooo foo bar").success)
    }

    func testProcessNotFound() {
        XCTAssertThrowsError(try system(command: "echoooooo foo bar"))
    }
}
