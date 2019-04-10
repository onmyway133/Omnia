//
//  NSLayoutConstraint+Extensions.swift
//  Omnia-iOS
//
//  Created by khoa on 10/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
    
    /// Disable auto resizing mask and activate constraints
    ///
    /// - Parameter constraints: constraints to activate
    static func e_on(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach {
            ($0.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
            $0.isActive = true
        }
    }
}
