import XCTest
import Omnia

class Optional_ExtensionsTests: XCTestCase {
    
    func testIsPresent() {
        do {
            let string: String? = ""
            XCTAssertFalse(string.e_isPresent)
        }
        
        do {
            let string: String? = "a"
            XCTAssertTrue(string.e_isPresent)
        }
    }
    
    func testLet() {
        let string: String? = ""
        
        var value: String? = nil
        string.e_let(closure: {
            value = $0
        })
        
        XCTAssertNotNil(value)
    }
}

