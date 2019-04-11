import XCTest
import Omnia

class OptionalTests: XCTestCase {
    
    func testIsPresent() {
        do {
            let string: String? = ""
            XCTAssertFalse(string.isPresent)
        }
        
        do {
            let string: String? = "a"
            XCTAssertTrue(string.isPresent)
        }
    }
    
    func testLet() {
        let string: String? = ""
        
        var value: String? = nil
        string.runIfNotNil(closure: {
            value = $0
        })
        
        XCTAssertNotNil(value)
    }
}

