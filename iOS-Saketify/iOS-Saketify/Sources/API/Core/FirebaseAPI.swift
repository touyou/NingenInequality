//
//  FirebaseAPI.swift
//  iOS-Saketify
//
//  Created by 藤井陽介 on 2019/10/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FirebaseAPI {
    static let shared = FirebaseAPI()

    private let decoder = Firestore.Decoder()
    private let encoder = Firestore.Encoder()

    private init() {}


}
