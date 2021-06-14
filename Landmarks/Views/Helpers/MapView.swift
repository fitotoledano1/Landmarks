//
//  MapView.swift
//  Landmarks
//
//  Created by Fito Toledano on 6/14/21.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 34.011_286,
            longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinates: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinates,
                                    span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    }
}

struct MapView_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        MapView(coordinate: landmarks[0].locationCoordinates)
    }
}
