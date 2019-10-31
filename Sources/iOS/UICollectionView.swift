//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(UIKit)

import UIKit

public extension UICollectionView {
    
    /// Register a cell
    ///
    /// - Parameter cell: The type of the cell
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    /// Dequeue a cell
    ///
    /// - Parameter indexPath: The indexPath to dequeue
    /// - Returns: The dequeued cell
    func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(
            withReuseIdentifier: String(describing: T.self),
            for: indexPath
        ) as? T
    }

    func centerIndexPath() -> IndexPath? {
        guard
            let point = superview?.convert(center, to: self),
            let indexPath = indexPathForItem(at: point)
            else {
                return nil
        }

        return indexPath
    }

    func sideCells() -> (leftCell: UICollectionViewCell?, rightCell: UICollectionViewCell?) {
        guard let indexPath = centerIndexPath() else {
            return (nil, nil)
        }

        let leftCell = cellForItem(at: IndexPath(item: indexPath.item-1, section: indexPath.section))
        let rightCell = cellForItem(at: IndexPath(item: indexPath.item+1, section: indexPath.section))

        return (leftCell, rightCell)
    }
}

#endif
