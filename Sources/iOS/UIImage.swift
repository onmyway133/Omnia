//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public extension UIImage {
    
    /// Init an UIImage from a UIColor
    ///
    /// - Parameter color: The color to fill
    /// - Parameter size: The size of the generated image
    /// - Returns: The image with solid color
    static func from(color: UIColor, size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            color.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
    }
}
