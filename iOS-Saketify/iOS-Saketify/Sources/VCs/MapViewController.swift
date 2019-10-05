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
import CoreLocation

final class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.setCenter(mapView.userLocation.coordinate, animated: true)
            mapView.userTrackingMode = .follow
        }
    }
    
    private var floatingPanel: FloatingPanelController!
    private var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFloatingPanel()
        setupLocation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        floatingPanel.removePanelFromParent(animated: animated)
    }

    private func setupFloatingPanel() {
        floatingPanel = FloatingPanelController()
        floatingPanel.delegate = self

        floatingPanel.surfaceView.cornerRadius = 16.0

        let viewController = ShopListViewController.instantiate()
        floatingPanel.set(contentViewController: viewController)
        floatingPanel.track(scrollView: viewController.tableView)
        floatingPanel.addPanel(toParent: self)
    }

    private func setupLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
}


extension MapViewController: FloatingPanelControllerDelegate {

}

extension MapViewController: CLLocationManagerDelegate {
    
}
