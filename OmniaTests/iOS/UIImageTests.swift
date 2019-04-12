//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class UIImagExtensionsTests: XCTestCase {
    
    func testInitFromColor() {
        let image = UIImage.from(color: .red, size: CGSize(width: 20, height: 20))
        XCTAssertEqual(image.size, CGSize(width: 20, height: 20))
    }
}
