//
//  Items.swift
//  iOS-Saketify
//
//  Created by Satoshi Komatsu on 2019/10/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import CoreLocation

struct SuggestBeerRequest: Codable {
    var rest: [Shop]
}

struct Shop: Codable {
    var id: String
    var name: String
    var longitude: String
    var latitude: String
    var category: String
    var imageUrl: Image
    var budget: Int
}

struct Image: Codable {
    var shopImage1: String
}
