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
}

