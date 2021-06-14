//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Fito Toledano on 6/14/21.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Devices.allDevices, id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}

public enum Device: String, CaseIterable {
    case smallestScreen = "iPhone SE (2nd generation)"
    case largestScreen = "iPhone XS Max"
}
