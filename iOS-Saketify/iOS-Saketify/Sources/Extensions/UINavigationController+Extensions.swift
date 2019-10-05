//
//  UINavigationController+Extensions.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import UIKit

// MARK: - Setup Navigation Controller Appearance

public extension UINavigationController {

    func setupNavigationBar() {

        let titleView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        titleView.image =  #imageLiteral(resourceName: "logo_word.png")
        titleView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = titleView
        self.navigationItem.title = ""
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.Yabami.base]
        self.navigationBar.barTintColor = UIColor.Yabami.main
        self.navigationBar.tintColor = UIColor.Yabami.base
        self.navigationBar.backgroundColor = UIColor.Yabami.main
//        self.navigationBar.borderColor = UIColor.Yabami.black
//        self.navigationBar.borderWidth = 2
    }
}
