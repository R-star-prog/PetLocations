//
//  LandMark.swift
//  PetLocationsClose
//
//  Created by Rayo Belihomji on 5/27/20.
//  Copyright © 2020 Rayo Belihomji. All rights reserved.
//

import Foundation
import MapKit
import UIKit
//Structure to get the LandMark values
struct LandMark {
    
    let placemark: MKPlacemark
    
    
    // Instance Variables of the title, name, id, coordinates
   
    var name: String {
       
       
        placemark.name ?? ""
    
    }
   
   
    
    
    
   var id: UUID {
        return UUID()
    }
    
    
    
    
    
    
    
    var coordinate: CLLocationCoordinate2D {
       self.placemark.coordinate
    }
    
   
    
    var title: String {
        self.placemark.title ?? ""
    }
    
   
    
   
}

//Inner Class for the actual annotations

final class LandMarkAnnotations: NSObject, MKAnnotation {
   //Instance Variables
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(landmark: LandMark) {
        //Updates the title and coordinates
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
   
    
   
        
        
        
    
    
    
    
}
