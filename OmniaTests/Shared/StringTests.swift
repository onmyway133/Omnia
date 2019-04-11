import XCTest
import Omnia

class String_ExtensionsTests: XCTestCase {
    
    func testCapitalizedFirstLetter() {
        do {
            let string = ""
            XCTAssertEqual(string.capitalizedFirstLetter, "")
        }
        
        do {
            let string = "hello"
            XCTAssertEqual(string.capitalizedFirstLetter, "Hello")
        }
    }
}

