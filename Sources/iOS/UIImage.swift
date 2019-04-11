import UIKit

extension UIImage {
    
    /// Init an UIImage from a UIColor
    ///
    /// - Parameter color: The color to fill
    /// - Parameter size: The size of the generated image
    /// - Returns: The image from the snapshot
    public convenience init?(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContext(size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        context.setFillColor(color.cgColor)
        let rect = CGRect(origin: .zero, size: size)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else {
            return nil
        }
        
        self.init(cgImage: cgImage)
    }
}
