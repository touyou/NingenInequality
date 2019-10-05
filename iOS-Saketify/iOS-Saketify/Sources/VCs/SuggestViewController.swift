//
//  SuggestViewController.swift
//  iOS-Saketify
//
//  Created by Satoshi Komatsu on 2019/10/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit
import Koloda

final class SuggestViewController: UIViewController {
    private let cardWidth = CGFloat(250)
    private let cardHeight = CGFloat(300)
    @IBOutlet var kolodaView: KolodaView!
    
    
    override func viewDidLoad() {
        
//        kolodaView.frame = CGRect(x: 0, y: 0, width: cardWidth, height: cardHeight)
//        kolodaView.center = self.view.center
//        self.view.addSubview(kolodaView)
        kolodaView.dataSource = self
    }
}

extension SuggestViewController: KolodaViewDelegate {
    
}

extension SuggestViewController: KolodaViewDataSource {
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = UIImageView()
        view.image = UIImage(named: "image1")
        return view
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return 1
    }
    
    
}
