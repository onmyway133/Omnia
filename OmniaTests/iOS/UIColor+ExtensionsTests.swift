import XCTest
import Omnia

class UIColor_ExtensionsTests: XCTestCase {
    
    func testRandom() {
        let image = UIImage(
            e_color: UIColor.e_random(),
            size: CGSize(width: 100, height: 100)
        )
        
        XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
    }
    
    func testDarken() {
        let image = UIImage(
            e_color: UIColor.red.e_darken(),
            size: CGSize(width: 100, height: 100)
        )
        
        XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
    }
    
    func testLighten() {
        let image = UIImage(
            e_color: UIColor.red.e_lighten(),
            size: CGSize(width: 100, height: 100)
        )
        
        XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
    }
}
