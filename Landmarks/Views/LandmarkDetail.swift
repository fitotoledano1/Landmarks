//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Fito Toledano on 6/14/21.
//

import SwiftUI


struct LandmarkDetail: View {
    
    let landmark: Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                
                Divider()
                Text("About \(landmark.name)")
                Text(landmark.description)
            }
            
            .padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
