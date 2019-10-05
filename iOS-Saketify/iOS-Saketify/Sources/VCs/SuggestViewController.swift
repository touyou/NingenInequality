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
    @IBOutlet var kolodaView: KolodaView! {
        didSet {
            kolodaView.dataSource = self
            kolodaView.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.haikei()
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
