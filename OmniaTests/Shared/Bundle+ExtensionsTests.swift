import XCTest

class Bundle_ExtensionsTests: XCTestCase {

  private let bundle = Bundle(for: Bundle_ExtensionsTests.self)

  func testName() {
    XCTAssertTrue(bundle.e_name!.contains("-Tests"))
  }

  func testVersionNumber() {
    XCTAssertEqual(bundle.e_versionNumber, "1.0")
  }

  func testBuildNumber() {
    XCTAssertEqual(bundle.e_buildNumber, "1")
  }
}

