import XCTest
import Omnia

class NSObjectTests: XCTestCase {
    
    func testApply() {
        let label = UILabel()
        label.apply {
            $0.text = "hello"
        }
        
        XCTAssertEqual(label.text, "hello")
    }
}
