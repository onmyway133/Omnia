import XCTest
import Omnia

class UIViewControllerTests: XCTestCase {
    
    func testInstall() {
        let parent = UIViewController()
        let child = UIViewController()
        parent.install(childController: child)
        
        XCTAssertEqual(parent.children.first, child)
    }
    
    func testUninstall() {
        let parent = UIViewController()
        let child = UIViewController()
        parent.install(childController: child)
        child.uninstall()
        
        XCTAssertTrue(parent.children.isEmpty)
    }
}
