//
//  LocationManager.swift
//  PetLocationsClose
//
//  Created by Rayo Belihomji on 5/27/20.
//  Copyright © 2020 Rayo Belihomji. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    
    private let locationMang = CLLocationManager()
    
    @Published var location : CLLocation? = nil
    //Initializes the your location with certain protocols
    override init(){
        
        
        super.init()
        self.locationMang.delegate = self
        self.locationMang.distanceFilter = kCLDistanceFilterNone
        self.locationMang.desiredAccuracy = kCLLocationAccuracyBest
        self.locationMang.requestWhenInUseAuthorization()//Ask for permission
        self.locationMang.startUpdatingLocation()
    }
    
  
    //Sets your location
  private  func locationManager( arg manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         guard let location = locations.last
        else{
            return
        }
        self.location = location
    }
    
  
 
    
   
    


}

