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
        let keyId: String = "53183dc342ed72e6a3771606e79ead9c"
        
        typealias Response = SuggestBeerRequest
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return ""
        }
        
        var parameters: Any? {
            return [
                "keyid": keyId,
                "longitude": longitude,
                "latitude": latitude
            ]
        }
    }
}
