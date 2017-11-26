import XCTest
import Omnia

class UIColor_ExtensionsTests: XCTestCase {

  func testRandom() {
    let image = UIImage(
      omnia_color: UIColor.omnia_random(),
      size: CGSize(width: 100, height: 100)
    )

    XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
  }
}
