//
//  NSCollectionView.swift
//  Omnia-macOS
//
//  Created by khoa on 02/10/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(AppKit)

import AppKit

public extension NSCollectionView {
    func scrollToTop() {
        enclosingScrollView?.contentView.scroll(.zero)
    }
}

#endif
