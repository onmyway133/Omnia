//
//  File.swift
//  
//
//  Created by khoa on 08/01/2021.
//

import Foundation

public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
