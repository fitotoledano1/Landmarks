//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Fito Toledano on 6/14/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
        
    var filteredLandmarks: [Landmark] {
        showFavoritesOnly ? modelData.landmarks.filter { $0.isFavorite } : modelData.landmarks
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
//        ForEach(Devices.allDevices, id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//        }
    }
}
