//
//  JSONTests.swift
//  Omnia
//
//  Created by khoa on 12/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class JSONTests: XCTestCase {
    func test() {
        let json: [String: Any] = [
            "outside": [
                "object": [
                    "number": 1,
                    "text": "hello"
                ],
                "arrayOfObjects": [
                    [
                        "number": 2,
                        "text": "two"
                    ],
                    [
                        "number": 3,
                        "text": "three"
                    ]
                ],
                "arrayOfArrays": [
                    [
                        "one", "two", "three", "four"
                    ],
                    [
                        "five", "six", "seven"
                    ]
                ]
            ]
        ]

//        XCTAssertEqual(resolve(json, keyPath: "outside.object.number"), 1)
//        XCTAssertEqual(resolve(json, keyPath: "outside.object.text"), "hello")
//        XCTAssertEqual(resolve(json, keyPath: "outside.arrayOfObjects.1.number"), 3)
        XCTAssertEqual(resolve(json, keyPath: "outside.arrayOfArrays.1.1"), "six")
    }
}
