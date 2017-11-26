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

  func testDarken() {
    let image = UIImage(
      omnia_color: UIColor.red.omnia_darken(),
      size: CGSize(width: 100, height: 100)
    )

    XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
  }

  func testLighten() {
    let image = UIImage(
      omnia_color: UIColor.red.omnia_lighten(),
      size: CGSize(width: 100, height: 100)
    )

    XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
  }
}
