//
//  ShopListViewController.swift
//  iOS-Saketify
//
//  Created by 藤井陽介 on 2019/10/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class ShopListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(ShopListTableViewCell.self)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ShopListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShopListTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)

        return cell
    }
}

extension ShopListViewController: StoryboardInstantiable {}
