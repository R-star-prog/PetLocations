//
//  ContentView.swift
//  PetLocationsClose
//
//  Created by Rayo Belihomji on 5/27/20.
//  Copyright © 2020 Rayo Belihomji. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var locationMang: LocationManager = LocationManager()
   
    @State private  var landMarks : [LandMark] = [LandMark]()
     
    @State private var petSearch: String = ""
    
   
  
    
    
    
   var body: some View {
      
       ZStack(alignment: .top) {
           
           MapView(landMarks: landMarks)
           
           
           TextField("Type Pet Friendly Followed By Location", text: $petSearch, onEditingChanged: { _ in})
           {
               // For nearby locations
               self.getNearbyLandMarks()
            
               
           }.textFieldStyle(RoundedBorderTextFieldStyle())
               .padding()
               .offset(y : 44)
      
           
       }
   }
    
    
    private func getNearbyLandMarks(){
       //Gets the request
        let req = MKLocalSearch.Request()
        req.naturalLanguageQuery = petSearch
        
         let search = MKLocalSearch(request: req)
        
      
        
        search.start {(response, error)in
            
      
           
            
           
            if response != nil {
                
                self.landMarks = response!.mapItems.map{
                    LandMark(placemark: $0.placemark)
                }
            }
        
        
        }
       
        
    }

}

//Constructs the view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
