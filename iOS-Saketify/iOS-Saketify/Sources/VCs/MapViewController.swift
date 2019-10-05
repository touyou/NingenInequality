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
import APIKit

final class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.setCenter(mapView.userLocation.coordinate, animated: true)
            mapView.userTrackingMode = .follow
        }
    }
    
    private var floatingPanel: FloatingPanelController!
    private var locationManager: CLLocationManager!
    private var childViewController: ShopListViewController!

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

        childViewController = ShopListViewController.instantiate()
        floatingPanel.set(contentViewController: childViewController)
        floatingPanel.track(scrollView: childViewController.tableView)
        floatingPanel.addPanel(toParent: self)

        updateLocation(35.6551564, 139.6936439)
    }

    private func setupLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    func updateLocation(_ longitude: Double, _ latitude: Double) {

        let apiRequest = BeerAPI.SuggestBeer(longitude: String(longitude), latitude: String(latitude))
        Session.send(apiRequest) { result in
            switch result {
            case .success(let response):
                self.childViewController.shopData = response.rest
                print(response.rest)
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension MapViewController: FloatingPanelControllerDelegate {
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let longitude = location.coordinate.longitude as Double
            let latitude = location.coordinate.latitude as Double

            updateLocation(longitude, latitude)
        }
    }
}
