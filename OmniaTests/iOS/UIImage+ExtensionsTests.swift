import XCTest
import Omnia

class UIImage_ExtensionsTests: XCTestCase {

  func testInitFromColor() {
    let image = UIImage(omnia_color: UIColor.red, size: CGSize(width: 10, height: 10))
    XCTAssertEqual(image?.size, CGSize(width: 10, height: 10))
  }
}


