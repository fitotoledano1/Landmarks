//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Fito Toledano on 6/14/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
