//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class OptionalTests: XCTestCase {
    
    func testIsPresent() {
        do {
            let string: String? = ""
            XCTAssertFalse(string.isNotNilOrEmpty)
        }
        
        do {
            let string: String? = "a"
            XCTAssertTrue(string.isNotNilOrEmpty)
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

