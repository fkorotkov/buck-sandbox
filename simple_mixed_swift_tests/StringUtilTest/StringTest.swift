import Foundation
import XCTest

@testable import StringUtil

class StringTests: XCTestCase {
  func testIsPresent() {
    XCTAssertFalse("".isPresent)
    XCTAssertTrue("not empty".isPresent)
  }
}