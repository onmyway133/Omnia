import UIKit

public extension UIView {
    
    /// Take a snapshot of a view
    ///
    /// - Returns: The image from the snapshot
    func e_toImage() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        return renderer.image { _ in
            self.drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
    }
    
    /// Add many subviews
    ///
    /// - Parameter views: The subviews
    func e_addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}

public extension UIView {
    func e_pinCenter(view: UIView) {
        NSLayoutConstraint.e_on([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func pinEdges(view: UIView, inset: UIEdgeInsets = UIEdgeInsets.zero) {
        NSLayoutConstraint.e_on([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: inset.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: inset.bottom)
        ])
    }
    
    func e_pin(size: CGSize) {
        NSLayoutConstraint.e_on([
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ])
    }
}
