import UIKit

extension UIView {

  /// Take a snapshot of a view
  ///
  /// - Returns: The image from the snapshot
  public func e_toImage() -> UIImage? {
    let renderer = UIGraphicsImageRenderer(size: bounds.size)
    return renderer.image { _ in
        self.drawHierarchy(in: bounds, afterScreenUpdates: true)
    }
  }

  /// Add many subviews
  ///
  /// - Parameter views: The subviews
  public func e_addSubviews(_ views: [UIView]) {
    views.forEach {
      addSubview($0)
    }
  }
}
