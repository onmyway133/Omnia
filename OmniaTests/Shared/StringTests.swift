//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

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

