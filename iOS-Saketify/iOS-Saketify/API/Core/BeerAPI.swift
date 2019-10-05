//
//  BeerAPI.swift
//  iOS-Saketify
//
//  Created by Satoshi Komatsu on 2019/10/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import APIKit

final class BeerAPI {
    private init() {}
    
    struct SuggestBeer: BeerRequest {
        let longitude: String
        let latitude: String
        
        typealias Response = SuggestBeerRequest
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "default/beer1005-1"
        }
        
        var parameters: Any? {
            return [
                "x": longitude,
                "y": latitude
            ]
        }
    }
}
