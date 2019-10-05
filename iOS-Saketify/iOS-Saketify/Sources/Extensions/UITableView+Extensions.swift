//
//  UITableView+Extensions.swift
//  TokyoAPre
//
//  Created by 藤井陽介 on 2019/05/18.
//  Copyright © 2019 ヤバミオブザイヤー. All rights reserved.
//

import UIKit

// MARK: - Reusable Extensions

public extension UITableView {

    // MARK: Cell
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable {

        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UITableViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {

        let nib = UINib(nibName: T.nibName, bundle: Bundle(for: T.self))

        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {

        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {

            fatalError("Error occurred: reuse \(T.defaultReuseIdentifier)")
        }

        return cell
    }

    // MARK: Header and Footer
    func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {

        register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable, T: NibLoadable {

        let nib = UINib(nibName: T.nibName, bundle: Bundle(for: T.self))

        register(nib, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {

        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {

            fatalError("Error occurred: reuse \(T.defaultReuseIdentifier)")
        }

        return view
    }

    // MARK: Realod Utility

    func reloadData(at row: Int? = nil) {

        if let row = row {

            self.beginUpdates()
            self.reloadRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
            self.endUpdates()
        } else {

            self.reloadData()
        }
        self.layoutIfNeeded()
    }

    func reloadData(from: Int, to: Int) {

        self.beginUpdates()
        for index in from ..< to {
            self.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
        self.endUpdates()

        self.layoutIfNeeded()
    }
}
