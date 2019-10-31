//
//  MenuHandler.swift
//  Omnia-macOS
//
//  Created by khoa on 01/10/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(AppKit)

import AppKit

public class MenuHandler {
    public let menu = NSMenu()
    public var items = [Item]()

    public class Item {
        public let menuItem: NSMenuItem
        public let action: () -> Void

        public init(menuItem: NSMenuItem, action: @escaping () -> Void) {
            self.menuItem = menuItem
            self.action = action
        }
    }

    public init() {}

    public func add(title: String, action: @escaping () -> Void) {
        let menuItem = NSMenuItem(
            title: title,
            action: #selector(onMenuItemTouched(_:)),
            keyEquivalent: ""
        )

        menuItem.target = self
        menu.addItem(menuItem)

        let item = Item(menuItem: menuItem, action: action)
        items.append(item)
    }

    public func show(from button: NSButton, in view: NSView) {
        menu.popUp(
            positioning: nil,
            at: button.frame.origin,
            in: view
        )
    }

    @objc public func onMenuItemTouched(_ menuItem: NSMenuItem) {
        if let item = items.first(where: { $0.menuItem === menuItem }) {
            item.action()
        }
    }
}

#endif
