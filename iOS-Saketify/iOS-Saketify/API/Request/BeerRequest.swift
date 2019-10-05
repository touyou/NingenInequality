//
//  BeerRequest.swift
//  iOS-Saketify
//
//  Created by Satoshi Komatsu on 2019/10/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import APIKit

protocol BeerRequest: Request {}

extension BeerRequest {
    var baseURL: URL {
        let baseURLString: String = "https://62gxvsjd23.execute-api.ap-northeast-1.amazonaws.com/default/beer1005-1"
        return URL(string: baseURLString)!
    }
}

extension BeerRequest where Response: Codable {
    var dataParser: DataParser {
        return DecodeDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        
        guard let data = object as? Data else {
            return ResponseError.unexpectedObject(object) as! Self.Response
        }
        
        let jsonDecorder = JSONDecoder()
        jsonDecorder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try jsonDecorder.decode(Response.self, from: data)
    }
}
