//
//  MapViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 31/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController {
    
    private var mapView: GMSMapView?
    private var locationManager = CLLocationManager()
    private let defaultZoom: Float = 16
    
    private let mapSearchView = MapSearchView(frame: .zero)
    private let confirmButtonView = ConfirmButtonView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        checkAuthorizationStatus()
        configureGoogleMap()
        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.delegate = self
        mapView?.delegate = self
        
    }

    private func updateLocation(place: GMSPlace) {
        let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: defaultZoom)
        mapView?.camera = camera
        
        let marker = GMSMarker(position: place.coordinate)
        marker.title = place.name
        marker.snippet = place.formattedAddress
        marker.map = mapView
        print(marker.snippet!)
        mapSearchView.currentLocationLabel.text = place.formattedAddress
        
    }
    
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
    private func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedAlways || status == .authorizedWhenInUse,
            CLLocationManager.locationServicesEnabled()
            else { return }
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation()
    }
    
    private func configureViews() {
        mapSearchView.delegate = self
        
        var searchViewHeight: CGFloat = 0
        var confirmButtonViewHeight: CGFloat = 0
        
        view.addSubview(mapSearchView)
        view.addSubview(confirmButtonView)
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let windowHeight = appDelegate.window?.frame.height {
            searchViewHeight = windowHeight
            confirmButtonViewHeight = windowHeight
        }
        
        mapSearchView.translatesAutoresizingMaskIntoConstraints = false
        mapSearchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        mapSearchView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        mapSearchView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        mapSearchView.heightAnchor.constraint(equalToConstant: searchViewHeight / 8).isActive = true
        
        confirmButtonView.translatesAutoresizingMaskIntoConstraints = false
        confirmButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        confirmButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        confirmButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        confirmButtonView.heightAnchor.constraint(equalToConstant: confirmButtonViewHeight / 16).isActive = true
    }
    
    private func setDefaultLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: defaultZoom)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        
        marker.title = "default"
        marker.map = mapView
    }
    
    private func setCurrentLocation() {
        let coordinate = CLLocationCoordinate2D()
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: defaultZoom)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
    }
    
    private func configureGoogleMap() {
//        setDefaultLocation(latitude: 37.497, longitude: 127.0254)
        setCurrentLocation()
        
        guard let gestureRecognizers = mapView?.gestureRecognizers else { return }
        for (index, gesture) in gestureRecognizers.enumerated() {
            if index == 0 {
                mapView?.removeGestureRecognizer(gesture)
            }
        }
    }

}

extension MapViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        updateLocation(place: place)
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
        print(error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension MapViewController: MapSearchViewDelegate {
    func addressSearch() {
        let viewController = GMSAutocompleteViewController()
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
}

extension MapViewController: GMSMapViewDelegate, CLLocationManagerDelegate {
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        mapView.clear()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let camera = GMSCameraPosition.camera(withLatitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude, zoom: defaultZoom)
        
        mapView?.camera = camera
        mapView?.isMyLocationEnabled = true
        
        let marker = GMSMarker(position: center)
        marker.map = mapView
        marker.title = "내 위치"
        
        locationManager.stopUpdatingLocation()
    }
}
