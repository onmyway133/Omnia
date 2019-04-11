//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

extension Comparable {
    
    /// Check if a number is between 2 numbers
    ///
    /// - Parameters:
    ///   - min: The min number
    ///   - max: The max number
    /// - Returns: True if it is between
    public func isBetween(min: Self, max: Self) -> Bool {
        return min <= self && self <= max
    }
}
