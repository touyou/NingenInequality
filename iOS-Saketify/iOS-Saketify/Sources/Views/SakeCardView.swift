//
//  SakeCardView.swift
//  iOS-Saketify
//
//  Created by Satoshi Komatsu on 2019/10/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class SakeCardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sakeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var stackView: UIStackView {
        let view = UIStackView(arrangedSubviews: [sakeImageView, label])
        view.axis = .vertical
        view.alignment = .fill
        return view
    }
}
