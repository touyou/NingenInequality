//
//  StoryboardInstantiable.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import UIKit

// MARK: - Storyboard Instantiable

public protocol StoryboardInstantiable: class {

    static var storyboardName: String { get }
}

public extension StoryboardInstantiable where Self: UIViewController {

    static var storyboardName: String {

        return String(describing: self)
    }

    static func instantiate() -> Self {

        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)

        guard let controller = storyboard.instantiateInitialViewController() as? Self else {

            fatalError("Not Found \(storyboardName).swift.")
        }

        return controller
    }
}
