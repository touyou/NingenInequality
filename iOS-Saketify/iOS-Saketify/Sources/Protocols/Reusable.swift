//
//  Reusable.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import UIKit

// MARK: Reusable

public protocol Reusable: class {

    static var defaultReuseIdentifier: String { get }
}

public extension Reusable where Self: UIView {

    static var defaultReuseIdentifier: String {

        return String(describing: self)
    }
}
