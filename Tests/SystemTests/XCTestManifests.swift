import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
      testCase(StandardErrorTests.allTests),
      testCase(StandardOutputTests.allTests),
      testCase(SuccessFailureTests.allTests),
    ]
}
#endif
