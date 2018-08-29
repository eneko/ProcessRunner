import XCTest

import SystemTests

var tests = [XCTestCaseEntry]()
tests += SystemTests.allTests()
XCTMain(tests)
