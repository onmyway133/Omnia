//
//  NSLayoutConstraint+Extensions.swift
//  Omnia-iOS
//
//  Created by khoa on 10/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(UIKit) && os(iOS)

import UIKit

public extension NSLayoutConstraint {
    
    /// Disable auto resizing mask and activate constraints
    ///
    /// - Parameter constraints: constraints to activate
    static func on(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach {
            ($0.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
            $0.isActive = true
        }
    }
    
    static func on(_ constraintsArray: [[NSLayoutConstraint]]) {
        let constraints = constraintsArray.flatMap({ $0 })
        NSLayoutConstraint.on(constraints)
    }
    
    func priority(_ value: Float) -> NSLayoutConstraint {
        priority = UILayoutPriority(value)
        return self
    }
}

#endif
