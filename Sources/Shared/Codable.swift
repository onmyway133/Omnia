//
//  Codable.swift
//  Omnia-iOS
//
//  Created by khoa on 12/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

// https://github.com/JohnSundell/Codextended

public extension Decoder {
    func decode<T: Decodable>(key: String, type: T.Type = T.self) throws -> T {
        return try decode(codingKey: SingleCodingKey(key: key), type: type)
    }
    
    func decode<T: Decodable, K: CodingKey>(codingKey: K, type: T.Type = T.self) throws -> T {
        let container = try self.container(keyedBy: K.self)
        return try container.decode(type, forKey: codingKey)
    }
}

private struct SingleCodingKey: CodingKey {
    var stringValue: String
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    
    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = String(intValue)
    }
    
    init(key: String) {
        self.stringValue = key
    }
}
