import UIKit

extension UITableView {
    
    /// Register a cell
    ///
    /// - Parameter cell: The type of the cell
    public func e_register<T: UITableViewCell>(cellType: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
    
    /// Dequeue a cell
    ///
    /// - Parameter indexPath: The indexPath to dequeue
    /// - Returns: The dequeued cell
    public func e_dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(
            withIdentifier: String(describing: T.self),
            for: indexPath
            ) as? T
    }
}
