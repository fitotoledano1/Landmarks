//
//  ModelData.swift
//  Landmarks
//
//  Created by Fito Toledano on 6/14/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let fileUrl = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in the main bundle.")
    }
    
    do {
        data = try Data(contentsOf: fileUrl)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
