//
//  UIColor+Extensions.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import UIKit

// MARK: Project Color

public extension UIColor {
    class Saketify {
        public static let background = UIColor(hex: "#060E1E")
        public static let tab = UIColor(hex: "#10192B")
        public static let cardBackground = UIColor(hex: "#F7F1F1")
    }
}

// MARK: hex Initialization

public extension UIColor {
    convenience init(hex: String) {

        let colorString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased().filter { "#" != $0 }
        let alpha: CGFloat = colorString.count == 6 ? 1.0 : 0.0
        var rgb: UInt32 = 0
        Scanner(string: colorString).scanHexInt32(&rgb)

        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: alpha)
    }
}
