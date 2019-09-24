//
//  CollectionViewHandler.swift
//  Omnia-macOS
//
//  Created by khoa on 24/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import AppKit

public class CollectionViewHandler<Item: Equatable, Cell: NSCollectionViewItem>
: NSObject, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {

    public let layout = NSCollectionViewFlowLayout()
    public let scrollView = NSScrollView()
    public let collectionView = ClickedCollectionView()

    public var items = [Item]()
    public var itemSize: () -> CGSize = { .zero }
    public var configure: (Item, Cell) -> Void = { _, _ in }

    override init() {
        super.init()

        layout.minimumLineSpacing = 4
        layout.sectionInset = NSEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = layout
        collectionView.allowsMultipleSelection = false
        collectionView.backgroundColors = [.clear]
        collectionView.isSelectable = true

        collectionView.register(Cell.self, forItemWithIdentifier: Cell.itemId)

        scrollView.documentView = collectionView
    }

    // MARK: - Items

    public func add(item: Item) {
        items.insert(item, at: 0)
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.animator().insertItems(at: Set(arrayLiteral: indexPath))
    }

    public func remove(item: Item) {
        guard let index = items.firstIndex(where: { $0 == item }) else {
            return
        }

        remove(index: index)
    }

    public func remove(index: Int) {
        items.remove(at: index)
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.animator().deleteItems(at: Set(arrayLiteral: indexPath))
    }

    // MARK: - NSCollectionViewDataSource

    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {

        let cell = collectionView.makeItem(withIdentifier: Cell.itemId, for: indexPath) as! Cell
        let item = items[indexPath.item]
        configure(item, cell)
        return cell
    }

    // MARK: - NSCollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {

        return itemSize()
    }
}

