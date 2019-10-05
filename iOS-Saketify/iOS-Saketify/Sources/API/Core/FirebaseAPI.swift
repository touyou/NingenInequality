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
    private let rootSnapshot = Firestore.firestore()

    private init() {}

    func get(_ completion: (([BeerItem]) -> Void)?) {
        rootSnapshot.collection("items").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else { return }

            var items = [BeerItem]()
            documents.forEach {
                do {
                    if let item = try $0.data(as: BeerItem.self, decoder: self.decoder) {
                        items.append(item)
                    }
                } catch {
                    print(error)
                }
            }
            completion?(items)
        }
    }

    func add(_ item: BeerItem) {
        do {
            _ = try rootSnapshot.collection("items").addDocument(from: item, encoder: encoder) { error in
                if let error = error {
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
}
