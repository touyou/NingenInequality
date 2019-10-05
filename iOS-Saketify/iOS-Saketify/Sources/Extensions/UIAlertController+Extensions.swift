//
//  UIAlertController+Extensions.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import UIKit

// MARK: - Easy Setup Extensions

public extension UIAlertController {

    func addAction(title: String, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? = nil) -> Self {

        let action = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(action)
        return self
    }

    func show() {

        UIApplication.shared.topPresentedViewController?.present(self, animated: true, completion: nil)
    }
}
