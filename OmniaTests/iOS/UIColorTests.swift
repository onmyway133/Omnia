//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(UIKit)

import XCTest
import Omnia

class UIColorTests: XCTestCase {
    func testDarken() {
        let _ = UIColor.red.darken()
    }
    
    func testLighten() {
        let _ = UIColor.red.lighten()
    }
}

#endif
