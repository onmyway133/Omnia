import XCTest

class Comparable_ExtensionsTests: XCTestCase {

  func testIsBetween() {
    XCTAssertTrue(5.omnia_isBetween(min: 1, max: 10))
    XCTAssertTrue(5.omnia_isBetween(min: 5, max: 10))
    XCTAssertFalse(5.5.omnia_isBetween(min: 5.6, max: 5.7))
  }
}
