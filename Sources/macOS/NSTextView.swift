//
//  NSTextView.swift
//  Omnia-macOS
//
//  Created by khoa on 20/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(AppKit) && !targetEnvironment(macCatalyst)

import AppKit

public extension NSTextView {
    func styleAsLabel(color: NSColor, font: NSFont) {
        textColor = color
        self.font = font
        isEditable = false
        backgroundColor = NSColor.clear
    }
}

#endif
