//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class NSObjectTests: XCTestCase {
    
    func testApply() {
        let label = UILabel()
        label.apply {
            $0.text = "hello"
        }
        
        XCTAssertEqual(label.text, "hello")
    }
}
