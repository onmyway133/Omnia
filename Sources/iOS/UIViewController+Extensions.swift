import UIKit

extension UIViewController {
    /// Add a child view controller
    ///
    /// - Parameter chilController: The child view controller to add
    public func e_add(childController: UIViewController) {
        addChild(childController)
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
    }
    
    /// Remove from the parent view controller
    public func e_remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
