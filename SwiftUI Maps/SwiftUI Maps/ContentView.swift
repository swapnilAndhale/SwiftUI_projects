//
//  ContentView.swift
//  SwiftUI Maps
//
//  Created by Swapnil on 08/10/22.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19, longitude: 74), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let annotation = [
    City(name: "Pune", coordinate: CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567)),
    City(name: "Nagar", coordinate: CLLocationCoordinate2D(latitude: 19.0948, longitude: 74.7480))
    ]
    
    var body: some View {
       // Map(coordinateRegion: $region)
         //   .ignoresSafeArea()
            //.frame(width: 400, height: 300)
        
//        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.04, longitude: 74.14), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [.all])
        
        Map(coordinateRegion: $region, annotationItems: annotation) {
            //MapMarker(coordinate: $0.coordinate) {
            MapAnnotation(coordinate: $0.coordinate) {
                Circle()
                    .strokeBorder(.red, lineWidth: 4)
                    .frame(width: 40, height: 40)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
