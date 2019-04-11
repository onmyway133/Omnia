//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

extension Optional {
    
    /// Unwrap with message
    ///
    /// - Parameter message: A message to give more info
    public func unwrap(message: String) -> Wrapped {
        if let value = self {
            return value
        } else {
            fatalError(message)
        }
    }
    
    /// Same as Kotlin Nullable.let
    /// Run the closure if it is not nil
    ///
    /// - Parameter closure: The closure to be run
    public func runIfNotNil(closure: (Wrapped) -> Void) {
        if let value = self {
            closure(value)
        }
    }
}

extension Optional where Wrapped == String {
    
    /// Return true if it is not nil and not empty
    public var isNotNilOrEmpty: Bool {
        if let value = self {
            return !value.isEmpty
        } else {
            return false
        }
    }
}
