//
//  CodableTests.swift
//  Omnia
//
//  Created by khoa on 12/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class Superhero: Codable {
    let name: String
    let weapon: String
    let year: [Int]
    
    required init(from decoder: Decoder) throws {
        self.name = try decoder.decode(key: "name")
        self.weapon = try decoder.decode(key: "weapon")
        self.year = try decoder.decode(key: "year")
    }
}

class CodableTests: XCTestCase {
    func testDecode() {
        let json: [String: Any] = [
            "name": "Thor",
            "weapon": "Hammer",
            "year": [2013, 2015, 2017]
        ]
        
        let data = try! JSONSerialization.data(withJSONObject: json, options: [])
        let decoder = JSONDecoder()
        let superhero = try! decoder.decode(Superhero.self, from: data)
        
        XCTAssertEqual(superhero.year, [2013, 2015, 2017])
    }
}
