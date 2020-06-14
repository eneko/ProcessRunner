#if !canImport(ObjectiveC)
import XCTest

extension ProcessRunnerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ProcessRunnerTests = [
        ("testShell", testShell),
        ("testWhich", testWhich)
    ]
}

extension StandardErrorTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__StandardErrorTests = [
        ("testStandardError", testStandardError),
        ("testStandardErrorShell", testStandardErrorShell)
    ]
}

extension StandardOutputTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__StandardOutputTests = [
        ("testEchoCombined", testEchoCombined),
        ("testEchoEscaping", testEchoEscaping),
        ("testEchoSplit", testEchoSplit),
        ("testNoStandardOutput", testNoStandardOutput),
        ("testPipe", testPipe),
        ("testRedirect", testRedirect),
        ("testShell", testShell),
        ("testShellPipe", testShellPipe),
        ("testShellRedirect", testShellRedirect),
        ("testShellRedirectPipe", testShellRedirectPipe)
    ]
}

extension SuccessFailureTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__SuccessFailureTests = [
        ("testFailure", testFailure),
        ("testProcessNotFound", testProcessNotFound),
        ("testSuccess", testSuccess)
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ProcessRunnerTests.__allTests__ProcessRunnerTests),
        testCase(StandardErrorTests.__allTests__StandardErrorTests),
        testCase(StandardOutputTests.__allTests__StandardOutputTests),
        testCase(SuccessFailureTests.__allTests__SuccessFailureTests)
    ]
}
#endif