//
//  UITabBar+Extensions.swift
//  YabamiKit
//
//  Created by 藤井陽介 on 2019/07/03.
//  Copyright © 2019 touyou. All rights reserved.
//

import UIKit

// MARK: - Change Height

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        let height = UIScreen.main.bounds.size.height
        if height >= 800 {
            size.height = 120
        } else if height >= 600 {
            size.height = 80
        } else {
            size.height = 40
        }
        return size
    }
}
