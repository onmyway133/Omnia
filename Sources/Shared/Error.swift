//
//  Error.swift
//  Omnia
//
//  Created by khoa on 03/10/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

public extension Error {
    func toString() -> String {
        return String(describing: self)
    }
}
