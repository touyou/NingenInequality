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
            let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
            let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: span)
            mapView.setRegion(region, animated: true)
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

//        floatingPanel.removePanelFromParent(animated: animated)
    }

    private func setupFloatingPanel() {
        floatingPanel = FloatingPanelController()
        floatingPanel.delegate = self

        floatingPanel.surfaceView.cornerRadius = 16.0

        childViewController = ShopListViewController.instantiate()
        floatingPanel.set(contentViewController: childViewController)
        floatingPanel.track(scrollView: childViewController.tableView)
        floatingPanel.addPanel(toParent: self)

        updateLocation(139.6936439, 35.6551564)
    }

    private func setupLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    func updateLocation(_ longitude: Double, _ latitude: Double) {

        let apiRequest = BeerAPI.SuggestBeer(longitude: String(longitude), latitude: String(latitude))
        print(try! apiRequest.buildURLRequest())
        Session.send(apiRequest) { result in
            switch result {
            case .success(let response):
                self.childViewController.shopData = response.rest
                response.rest.forEach { shop in
                    self.addAnnotation(Double(shop.latitude) as! CLLocationDegrees, Double(shop.longitude) as! CLLocationDegrees, shop.name)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func addAnnotation(_ latitude: CLLocationDegrees, _ longitude: CLLocationDegrees, _ title: String) {

        // ピンの生成
        let annotation = MKPointAnnotation()

        // 緯度経度を指定
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = title

        // mapViewに追加
        mapView.addAnnotation(annotation)
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
