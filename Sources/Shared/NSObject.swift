//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

extension NSObject {
    func apply(_ closure: (NSObject) -> Void) {
        closure(self)
    }
}
