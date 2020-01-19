//
//  LocationManager.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import CoreLocation

@objc open class LocationManager : NSObject , CLLocationManagerDelegate {
    
    static var shared = LocationManager()
    var locationManager: CLLocationManager = CLLocationManager()
    let operationQueue = OperationQueue()
    var startLocation: CLLocation!
    var lat = CLLocationDegrees()
    var lon = CLLocationDegrees()
    var latitude: String = ""
    var longitude: String = ""
    var location : CLLocation?
    
    func startMonitoring(_ completionHandler: @escaping () -> ()) {
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let authState = CLLocationManager.authorizationStatus()
        if(authState == .authorizedAlways || authState == .authorizedWhenInUse){
            
        } else {
            locationManager.requestAlwaysAuthorization()
        }
        let block = { completionHandler() }
        self.operationQueue.addOperation(block)
    }
    
    override init() {
        super.init()
        operationQueue.isSuspended = true
        locationManager.delegate = self
    }
    
    open func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation: CLLocation = locations.last!
        latitude = String(format: "%.4f",
                          latestLocation.coordinate.latitude)
        longitude = String(format: "%.4f",
                           latestLocation.coordinate.longitude)
        location = latestLocation
        self.operationQueue.isSuspended = false
    }
    
    open func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    func stopMonitoring() {
        self.locationManager.stopUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedAlways || status == .authorizedWhenInUse){
        } else if(status == .denied){
            self.operationQueue.cancelAllOperations()
        }
    }
}
