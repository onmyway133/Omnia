import XCTest

class Comparable_ExtensionsTests: XCTestCase {

  func testIsBetween() {
    XCTAssertTrue(5.omnia_isBetween(min: 1, max: 10))
    XCTAssertTrue(5.omnia_isBetween(min: 5, max: 10))
    XCTAssertFalse(5.5.omnia_isBetween(min: 5.6, max: 5.7))

    do {
      let min = Date(timeIntervalSinceNow: -10)
      let max = Date(timeIntervalSinceNow: 10)
      XCTAssertTrue(Date().omnia_isBetween(min: min, max: max))
    }
  }
}
