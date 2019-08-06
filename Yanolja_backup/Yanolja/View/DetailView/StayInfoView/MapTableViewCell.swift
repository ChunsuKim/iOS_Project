//
//  MapTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    /*
    private var mapView: GMSMapView?
    private var locationManager = CLLocationManager()
    private let defaultZoom: Float = 16
    
    var stayMapView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(stayMapView)
        
        checkAuthorizationStatus()
        configureGoogleMap()
        
        configureConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateLocation(place: GMSPlace) {
        let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: defaultZoom)
        mapView?.camera = camera
        
        let marker = GMSMarker(position: place.coordinate)
        marker.title = place.name
        marker.snippet = place.formattedAddress
        marker.map = mapView
        print(marker.snippet!)
        
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
    
    private func setDefaultLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: defaultZoom)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        stayMapView = mapView
        
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
        stayMapView = mapView
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
    
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            stayMapView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stayMapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stayMapView.heightAnchor.constraint(equalToConstant: 150),
            stayMapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            stayMapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }*/

}
