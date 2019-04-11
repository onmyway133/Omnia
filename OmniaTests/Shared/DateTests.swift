//
//  DateTests.swift
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class DateTests: XCTestCase {

    func testComponent() {
        let date = Date(timeIntervalSince1970: 1554985373)
        
        XCTAssert(date.second == 53)
        XCTAssert(date.minute == 22)
        XCTAssert(date.hour == 14) // current timezone, GMT+2
        XCTAssert(date.day == 11)
        XCTAssert(date.month == 4)
        XCTAssert(date.year == 2019)
        XCTAssert(date.weekday == 5)
    }
}
