//
//  MapViewController.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: BaseViewController {
    
    @IBOutlet var mapView: MKMapView!
    var address : UserAddress!
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapUI()
        
        let latitude = CLLocationDegrees(Double(address.geo!.lat!) ?? 0 )
        let longitude = CLLocationDegrees(Double(address.geo!.lng!) ?? 0 )
        
        let userLocation = CLLocation(latitude: latitude , longitude: longitude)
        let customLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        addAnotation(userLocation,address)
        centerMapOnLocation(userLocation)
    }
    
    func setMapUI()  {
        mapView.mapType = .standard
        mapView.userTrackingMode = .follow
        //mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func addAnotation (_ location: CLLocation, _ address : UserAddress) {
        let artwork = UserAnotation(title: address.city ,
                              locationName: address.street,
                              discipline: address.suite,
                              coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude , longitude: location.coordinate.longitude))
        mapView.addAnnotation(artwork)
    }
}
