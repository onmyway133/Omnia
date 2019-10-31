//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(UIKit) && os(iOS)

import UIKit

public extension UIView {
    
    /// Take a snapshot of a view
    ///
    /// - Returns: The image from the snapshot
    func toImage() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        return renderer.image { _ in
            self.drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
    }
    
    /// Add many subviews
    ///
    /// - Parameter views: The subviews
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }

    func findRecursively<T: UIView>(type: T.Type, match: (T) -> Bool) -> T? {
        for view in subviews {
            if let subview = view as? T, match(subview) {
                return subview
            } else {
                return view.findRecursively(type: type, match: match)
            }
        }

        return nil
    }
}

public extension UIView {
    func pinCenter(view: UIView) -> [NSLayoutConstraint] {
        return [
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }
    
    func pinEdges(view: UIView, inset: UIEdgeInsets = UIEdgeInsets.zero) -> [NSLayoutConstraint] {
        return [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: inset.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: inset.bottom)
        ]
    }
    
    func pin(size: CGSize) -> [NSLayoutConstraint] {
        return [
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ]
    }
}

#endif
