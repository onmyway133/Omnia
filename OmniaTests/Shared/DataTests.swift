//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class DataTests: XCTestCase {
    func testToString() {
        let string = "Hello world"
        XCTAssertEqual(string.toData().toString(), "Hello world")
    }
}
