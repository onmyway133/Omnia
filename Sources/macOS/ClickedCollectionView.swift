//
//  ClickedCollectionView.swift
//  Omnia-macOS
//
//  Created by khoa on 24/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import AppKit

public class ClickedCollectionView: NSCollectionView {
    public var clickedIndex: Int?
    public var inSection: () -> Int = { 0 }

    public override func menu(for event: NSEvent) -> NSMenu? {
        clickedIndex = nil

        let point = convert(event.locationInWindow, from: nil)
        for index in 0..<numberOfItems(inSection: inSection()) {
            let frame = layoutAttributesForItem(at: IndexPath(item: index, section: inSection()))?.frame ?? .zero
            if NSMouseInRect(point, frame, isFlipped) {
                clickedIndex = index
                break
            }
        }

        return super.menu(for: event)
    }
}
