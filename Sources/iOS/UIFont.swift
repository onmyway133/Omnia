//
//  UIFont.swift
//  Omnia-iOS
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public extension UIFont {
    static func registerCustom(fileName: String, fileExtension: String, bundle: Bundle = .main) {
        guard
            let url = bundle.url(forResource: fileName, withExtension: fileExtension)
            let data = try? Data(contentsOf: url),
            let provider = CGDataProvider(data: data),
            let ref = CGFont(provider)
        else {
            return
        }
        
        var errorRef: Unmanaged<CFError>? = nil
        if !CTFontManagerRegisterGraphicsFont(ref, &errorRef) {
            print(errorRef)
        }
    }
}
