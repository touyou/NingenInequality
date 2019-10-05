//
//  UIImage+Extensions.swift
//  YabamiKit
//
//  Created by 藤井陽介 on 2019/06/30.
//  Copyright © 2019 touyou. All rights reserved.
//

import UIKit

// MARK: - Color Image Extension

public extension UIImage {
    static func colorImage(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
