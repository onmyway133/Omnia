import XCTest

class Bundle_ExtensionsTests: XCTestCase {

  private let bundle = Bundle(for: Bundle_ExtensionsTests.self)

  func testName() {
    XCTAssertTrue(bundle.omnia_name!.contains("-Tests"))
  }

  func testVersionNumber() {
    XCTAssertEqual(bundle.omnia_versionNumber, "1.0")
  }

  func testBuildNumber() {
    XCTAssertEqual(bundle.omnia_buildNumber, "1")
  }
}

