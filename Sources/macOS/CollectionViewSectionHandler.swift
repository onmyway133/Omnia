//
//  CollectionViewSectionHandler.swift
//  Omnia-macOS
//
//  Created by khoa on 02/10/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import AppKit

open class CollectionViewSectionHandler<Item: Equatable, Cell: NSCollectionViewItem, HeaderView: NSView>
: CollectionViewHandler<Item, Cell> {

    public struct Section {
        public let name: String
        public let items: [Item]

        public init(name: String, items: [Item]) {
            self.name = name
            self.items = items
        }
    }

    public var sections = [Section]()
    public var configureHeader: (Section, HeaderView) -> Void = { _, _ in }

    public override init() {
        super.init()

        layout.headerReferenceSize = CGSize(width: 100, height: 20)

        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: NSCollectionView.elementKindSectionHeader,
            withIdentifier: HeaderView.itemId
        )
    }

    open func reload(sections: [Section]) {
        self.sections = sections
        collectionView.reloadData()
    }

    override open func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return sections.count
    }

    override open func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    override open func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {

        let item = sections[indexPath.section].items[indexPath.item]
        let cell = collectionView.makeItem(withIdentifier: Cell.itemId, for: indexPath) as! Cell
        configure(item, cell)
        return cell
    }

    @objc (collectionView:viewForSupplementaryElementOfKind:atIndexPath:)
    open func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {

        if kind == NSCollectionView.elementKindSectionHeader {
            let view = collectionView.makeSupplementaryView(
                ofKind: kind,
                withIdentifier: HeaderView.itemId,
                for: indexPath
            ) as! HeaderView

            configureHeader(sections[indexPath.section], view)
            return view
        } else {
            return NSView()
        }
    }

    @objc open override func onMenuItemClicked(_ menuItem: NSMenuItem) {
        guard
            let indexPath = collectionView.clickedIndexPath,
            indexPath.section < sections.count,
            let menuItemAction = self.menuItemActions.first(where: { $0.menuItem == menuItem })
        else {
            return
        }

        let section = sections[indexPath.section]

        guard
            indexPath.item < section.items.count
        else {
            return
        }

        menuItemAction.action(section.items[indexPath.item], indexPath)
    }
}


