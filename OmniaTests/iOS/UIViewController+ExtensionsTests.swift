import XCTest
import Omnia

class UIViewController_ExtensionsTests: XCTestCase {

  func testAdd() {
    let parent = UIViewController()
    let child = UIViewController()
    parent.e_add(childController: child)

    XCTAssertEqual(parent.childViewControllers.first, child)
  }

  func testRemove() {
    let parent = UIViewController()
    let child = UIViewController()
    parent.e_add(childController: child)
    child.e_remove()

    XCTAssertTrue(parent.childViewControllers.isEmpty)
  }
}
