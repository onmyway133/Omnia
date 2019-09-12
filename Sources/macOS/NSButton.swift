//
//  NSButton.swift
//  Omnia-macOS
//
//  Created by khoa on 12/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import AppKit

public extension NSButton {
    func stylePlain(title: String, color: NSColor, font: NSFont) {
        attributedTitle = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: font
        ])

        isBordered = false
        setButtonType(.momentaryChange)
    }
}
