//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    /// Scroll to bottom
    public func scrollToBottom() {
        let bottomOffset = CGPoint(
            x: 0,
            y: contentSize.height - bounds.size.height + contentInset.bottom
        )
        
        setContentOffset(bottomOffset, animated: true)
    }
}
