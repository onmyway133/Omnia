import XCTest
import Omnia

class String_ExtensionsTests: XCTestCase {

  func testCapitalizedFirstLetter() {
    do {
      let string = ""
      XCTAssertEqual(string.e_capitalizedFirstLetter, "")
    }

    do {
      let string = "hello"
      XCTAssertEqual(string.e_capitalizedFirstLetter, "Hello")
    }
  }
}

