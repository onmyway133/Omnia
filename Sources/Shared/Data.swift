//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

extension Data {
    
    /// Convert to hex string
    public var hexString: String {
        return map({ String(format: "%02hhx", $0) }).joined()
    }
}
