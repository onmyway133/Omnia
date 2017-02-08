import XCTest
@testable import Omnia

class OmniaTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Omnia().text, "Hello, World!")
    }


    static var allTests : [(String, (OmniaTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
