//
//  ShopListTableViewCell.swift
//  iOS-Saketify
//
//  Created by 藤井陽介 on 2019/10/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit
import Kingfisher

class ShopListTableViewCell: UITableViewCell {
    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rateLabel: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupView(item: Shop) {
        shopNameLabel.text = item.name
        genreLabel.text = item.category
        priceLabel.text = "¥3000"
        shopImageView.kf.setImage(with: URL(string: item.imageUrl.shopImage1), placeholder: UIImage(named: "restaurant"))
    }
}

extension ShopListTableViewCell: NibLoadable, Reusable {}
