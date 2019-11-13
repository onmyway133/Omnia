//
//  ClickedCollectionView.swift
//  Omnia-macOS
//
//  Created by khoa on 24/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(AppKit) && !targetEnvironment(macCatalyst)

import AppKit

public class ClickedCollectionView: NSCollectionView {
    public var clickedIndexPath: IndexPath?

    public override func menu(for event: NSEvent) -> NSMenu? {
        clickedIndexPath = nil

        let point = convert(event.locationInWindow, from: nil)
        for section in 0..<numberOfSections {
            for index in 0..<numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: index, section: section)
                let frame = layoutAttributesForItem(at: indexPath)?.frame ?? .zero
                if NSMouseInRect(point, frame, isFlipped) {
                    clickedIndexPath = indexPath
                    break
                }
            }
        }

        return super.menu(for: event)
    }
}

#endif
