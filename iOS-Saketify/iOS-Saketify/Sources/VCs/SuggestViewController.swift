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
//    var kolodaView = KolodaView() {
//        didSet {
//            kolodaView.delegate = self
//            kolodaView.dataSource = self
//        }
//    }
    
    override func viewDidLoad() {
//        kolodaView.frame = CGRect(x: 0, y: 0, width: cardWidth, height: cardHeight)
//        kolodaView.center = self.view.center
//        self.view.addSubview(kolodaView)
    }
}

extension SuggestViewController: KolodaViewDelegate {
    
}

extension SuggestViewController: KolodaViewDataSource {
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let card = SakeCardView()
        card.sakeImageView.image = UIImage(named: "Map.png")
        card.label.text = "this is a test"
        return view
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return 1
    }
    
    
}
