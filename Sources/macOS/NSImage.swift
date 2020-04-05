//
//  NSImage.swift
//  Omnia-macOS
//
//  Created by khoa on 12/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(AppKit) && !targetEnvironment(macCatalyst)

import AppKit

public extension NSImage {
    func tint(color: NSColor) -> NSImage {
        let image = self.copy() as! NSImage
        image.lockFocus()

        color.set()
        let imageRect = NSRect(origin: .zero, size: image.size)
        imageRect.fill(using: .sourceAtop)

        image.unlockFocus()

        return image
    }

    func resizeImage(_ width: CGFloat, _ height: CGFloat) -> NSImage {
        let img = NSImage(size: CGSize(width:width, height:height))

        img.lockFocus()
        let ctx = NSGraphicsContext.current
        ctx?.imageInterpolation = .high
        self.draw(
            in: NSMakeRect(0, 0, width, height),
            from: NSMakeRect(0, 0, size.width, size.height),
            operation: .copy,
            fraction: 1
        )
        img.unlockFocus()

        return img
    }
}

#endif
