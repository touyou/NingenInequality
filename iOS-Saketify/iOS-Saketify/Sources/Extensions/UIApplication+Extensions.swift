//
//  UIApplication+Extensions.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import UIKit

// MARK: - Present ViewController Extensions

public extension UIApplication {

    var topPresentedViewController: UIViewController? {

        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }

        while let presentedViewController = topViewController.presentedViewController {

            topViewController = presentedViewController
        }

        return topViewController
    }

    var topPresentedNavigationController: UINavigationController? {

        return topPresentedViewController as? UINavigationController
    }

    var topPresentedTabBarController: UITabBarController? {

        return topPresentedViewController as? UITabBarController
    }
}
