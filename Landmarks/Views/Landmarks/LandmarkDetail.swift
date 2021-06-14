//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Fito Toledano on 6/14/21.
//

import SwiftUI


struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
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
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
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
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
