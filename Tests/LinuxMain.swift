import XCTest

import systemTests

var tests = [XCTestCaseEntry]()
tests += systemTests.allTests()
XCTMain(tests)