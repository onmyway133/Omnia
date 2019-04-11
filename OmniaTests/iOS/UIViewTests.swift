import XCTest
import Omnia

class UIView_ExtensionsTests: XCTestCase {
    
    func testToImage() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Hello", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        let image = button.toImage()
        
        XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
    }
}

