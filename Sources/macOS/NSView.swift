//
//  NSView+Extensions.swift
//  Omnia-macOS
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import AppKit

public extension NSView {
    /// Add many subviews
    ///
    /// - Parameter views: The subviews
    func addSubviews(_ views: [NSView]) {
        views.forEach {
            addSubview($0)
        }
    }
}
