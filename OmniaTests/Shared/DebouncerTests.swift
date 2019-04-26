//
//  DebouncerTests.swift
//  Omnia
//
//  Created by khoa on 26/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class DebouncerTests: XCTestCase {

    func testDebounce() {
        let expectation = self.expectation(description: #function)
        let debouncer = Debouncer(delay: 0.5)
        var value = 0

        debouncer.run(action: {
            value = 1
        })

        debouncer.run(action: {
            value = 2
        })

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
            debouncer.run(action: {
                value = 3
            })
        })

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.71, execute: {
            XCTAssertEqual(value, 3)
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 1.2)
    }
}
