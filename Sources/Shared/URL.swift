//
//  URL.swift
//  Omnia
//
//  Created by khoa on 20/06/2021.
//

import Foundation
import CryptoKit

public extension String {
    var sha256Hashed: String {
        guard let data = data(using: .utf8) else {
            return self
        }
        
        let hashed = SHA256.hash(data: data)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
}

public extension URL {
    var sha256Hashed: String {
        absoluteString.sha256Hashed
    }
}
