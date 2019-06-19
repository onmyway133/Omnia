//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

/// Add-on utitlies to all types
/// https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/src/kotlin/util/Standard.kt
protocol TypeAddOnAware {}

extension TypeAddOnAware {
    /// Calls the specified closure with this instance as its receiver
    /// and returns this instance
    ///
    /// - Parameter closure: The closure to apply
    func apply(closure: (Self) -> Void) {
        closure(self)
    }
}

/// Conform NSObject by default
extension NSObject: TypeAddOnAware {}

extension NSObject {
    func with(_ closure: (NSObject) -> Void) {
        closure(self)
    }
}
