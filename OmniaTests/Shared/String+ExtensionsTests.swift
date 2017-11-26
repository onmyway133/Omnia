import XCTest
import Omnia

class String_ExtensionsTests: XCTestCase {

  func testCapitalizedFirstLetter() {
    do {
      let string = ""
      XCTAssertEqual(string.omnia_capitalizedFirstLetter, "")
    }

    do {
      let string = "hello"
      XCTAssertEqual(string.omnia_capitalizedFirstLetter, "Hello")
    }
  }
}

