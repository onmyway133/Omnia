//
//  NSCollectionViewItem.swift
//  Omnia-macOS
//
//  Created by khoa on 24/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import AppKit

public extension NSCollectionViewItem {
    static var itemId: NSUserInterfaceItemIdentifier {
        return NSUserInterfaceItemIdentifier(rawValue: String(describing: self))
    }
}
