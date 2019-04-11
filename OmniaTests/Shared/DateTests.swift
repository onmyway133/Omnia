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
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let date = Date(timeIntervalSince1970: 1554985373)
        
        XCTAssert(date.second(calendar: calendar) == 53)
        XCTAssert(date.minute(calendar: calendar) == 22)
        XCTAssert(date.hour(calendar: calendar) == 12)
        XCTAssert(date.day(calendar: calendar) == 11)
        XCTAssert(date.month(calendar: calendar) == 4)
        XCTAssert(date.year(calendar: calendar) == 2019)
        XCTAssert(date.weekday(calendar: calendar) == 5)
    }
}
