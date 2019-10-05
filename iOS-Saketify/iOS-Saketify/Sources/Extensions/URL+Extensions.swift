//
//  URL+Extensions.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import Foundation

// MARK: - Add Query Extension

public extension URL {

    func queryAdded(name: String, value: String?) -> URL? {

        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: nil != self.baseURL) else {

            return nil
        }

        components.queryItems = components.queryItems ?? []
        components.queryItems?.append(URLQueryItem(name: name, value: value))
        return components.url
    }
}
