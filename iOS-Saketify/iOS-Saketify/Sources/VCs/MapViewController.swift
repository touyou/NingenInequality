//
//  ViewController.swift
//  iOS-Saketify
//
//  Created by Satoshi Komatsu on 2019/10/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit
import FloatingPanel
import MapKit

final class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    private var floatingPanel: FloatingPanelController!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFloatingPanel()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        floatingPanel.removePanelFromParent(animated: animated)
    }

    func setupFloatingPanel() {
        floatingPanel = FloatingPanelController()
        floatingPanel.delegate = self

        let viewController = ShopListViewController.instantiate()
        floatingPanel.set(contentViewController: viewController)
        floatingPanel.track(scrollView: viewController.tableView)
        floatingPanel.addPanel(toParent: self)
    }
}


extension MapViewController: FloatingPanelControllerDelegate {

}
