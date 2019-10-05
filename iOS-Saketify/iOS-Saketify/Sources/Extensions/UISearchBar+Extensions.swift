//
//  UISearchBar+Extensions.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import UIKit

public extension UISearchBar {

    var textField: UITextField? {

        return value(forKey: "_searchField") as? UITextField
    }
}
