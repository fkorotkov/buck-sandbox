import Foundation
import XCTest

@testable import BridgingTest

class StringTests: XCTestCase {
    func testIsPresentrm () {
        XCTAssertEqual("Hello, World!", Foo().greeting())
    }
}