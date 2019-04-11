//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import XCTest
import Omnia

class UIColorTests: XCTestCase {
    
    func testRandom() {
        let image = UIImage(
            color: UIColor.random(),
            size: CGSize(width: 100, height: 100)
        )
        
        XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
    }
    
    func testDarken() {
        let image = UIImage(
            color: UIColor.red.darken(),
            size: CGSize(width: 100, height: 100)
        )
        
        XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
    }
    
    func testLighten() {
        let image = UIImage(
            color: UIColor.red.lighten(),
            size: CGSize(width: 100, height: 100)
        )
        
        XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
    }
}
