import XCTest
import Omnia

class Optional_ExtensionsTests: XCTestCase {

  func testIsPresent() {
    do {
      let string: String? = ""
      XCTAssertFalse(string.omnia_isPresent)
    }

    do {
      let string: String? = "a"
      XCTAssertTrue(string.omnia_isPresent)
    }
  }

  func testLet() {
    let string: String? = ""

    var value: String? = nil
    string.omnia_let(closure: {
      value = $0
    })

    XCTAssertNotNil(value)
  }
}

