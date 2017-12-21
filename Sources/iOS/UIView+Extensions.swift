import UIKit

extension UIView {

  /// Take a snapshot of a view
  ///
  /// - Returns: The image from the snapshot
  public func e_toImage() -> UIImage? {
    if #available(iOS 10.0, *) {
      let renderer = UIGraphicsImageRenderer(size: bounds.size)
      return renderer.image { _ in
        self.drawHierarchy(in: bounds, afterScreenUpdates: true)
      }
    } else {
      UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
      drawHierarchy(in: bounds, afterScreenUpdates: false)
      let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()

      return capturedImage
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
