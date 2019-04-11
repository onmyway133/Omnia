import XCTest

class BundlExtensionsTests: XCTestCase {
    
    private let bundle = Bundle(for: BundlExtensionsTests.self)
    
    func testName() {
        XCTAssertTrue(bundle.name!.contains("-Tests"))
    }
    
    func testVersionNumber() {
        XCTAssertEqual(bundle.versionNumber, "1.0")
    }
    
    func testBuildNumber() {
        XCTAssertEqual(bundle.buildNumber, "1")
    }
}

