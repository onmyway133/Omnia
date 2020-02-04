//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest

class ComparablExtensionsTests: XCTestCase {
    
    func testIsBetween() {
        XCTAssertTrue(5.isBetween(min: 1, max: 10))
        XCTAssertTrue(5.isBetween(min: 5, max: 10))
        XCTAssertFalse(5.5.isBetween(min: 5.6, max: 5.7))
        
        do {
            let min = Date(timeIntervalSinceNow: -10)
            let max = Date(timeIntervalSinceNow: 10)
            XCTAssertTrue(Date().isBetween(min: min, max: max))
        }
    }
}
