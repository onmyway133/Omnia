//
//  OnceTests.swift
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class OnceTests: XCTestCase {
    func testOnce() {
        let once = Once()
        var count = 0
        
        (0..<10).forEach { _ in
            once.run {
                count += 1
            }
        }
        
        XCTAssertEqual(count, 1)
    }
}
