import XCTest
import Omnia

class TypeAddOnTests: XCTestCase {

  func testApply() {
    let label = UILabel()
    label.e_apply {
      $0.text = "hello"
    }

    XCTAssertEqual(label.text, "hello")
  }
}
