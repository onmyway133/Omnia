import UIKit

extension UIViewController {
  /// Add a child view controller
  ///
  /// - Parameter chilController: The child view controller to add
  public func omnia_add(chilController: UIViewController) {
    addChildViewController(chilController)
    view.addSubview(chilController.view)
    chilController.didMove(toParentViewController: self)
  }

  /// Remove from the parent view controller
  public func omnia_remove() {
    guard parent != nil else {
      return
    }

    willMove(toParentViewController: nil)
    view.removeFromSuperview()
    removeFromParentViewController()
  }
}
