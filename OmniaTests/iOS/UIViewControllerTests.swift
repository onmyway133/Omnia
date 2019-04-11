import XCTest
import Omnia

class UIViewController_ExtensionsTests: XCTestCase {
    
    func testAdd() {
        let parent = UIViewController()
        let child = UIViewController()
        parent.add(childController: child)
        
        XCTAssertEqual(parent.children.first, child)
    }
    
    func testRemove() {
        let parent = UIViewController()
        let child = UIViewController()
        parent.add(childController: child)
        child.remove()
        
        XCTAssertTrue(parent.children.isEmpty)
    }
}
