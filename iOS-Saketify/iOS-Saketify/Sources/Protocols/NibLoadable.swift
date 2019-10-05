//
//  NibLoadable.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import UIKit

// MARK: - Nib Loadable

public protocol NibLoadable: class {

    static var nibName: String { get }
}

public extension NibLoadable where Self: UIView {

    static var nibName: String {

        return String(describing: self)
    }
}
