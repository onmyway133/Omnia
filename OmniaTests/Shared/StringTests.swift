import XCTest
import Omnia

class StringTests: XCTestCase {
    
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

