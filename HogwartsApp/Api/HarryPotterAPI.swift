//
//  HarryPotterAPI.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 1/6/21.
//

import Foundation

enum EndPoints {
    static let allCharacters = "/characters"
    static let charactersStudents = "/characters/students"
    static let charactersStaff = "/characters/staff"
    static let charactersHouses = "/characters/house/"
}

class HarryPortterAPI {
    
    static let shared = HarryPortterAPI()
    
    private let urlString = "https://hp-api.herokuapp.com/api"
    
    private init() {}
    
    func loadCharacters() {
        guard let url = URL(string: urlString + EndPoints.allCharacters) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Request failed: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            guard let content = String(data: data, encoding: .utf8) else {
                print("Content decoding failed")
                return
            }
            
            print("Request successful: \(content)")
            
            // If we need to update the UI with the content we must do it on the main thread
//            DispatchQueue.main.async {
//                updateUI()
//            }
        }.resume()
    }
    
    func loadCharacterByhouse(house: String, completion: @escaping ([Character]?, Error?) -> Void) {
        guard let url = URL(string: urlString + EndPoints.charactersHouses + house) else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Request failed \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([Character].self, from: data) {
                DispatchQueue.main.async {
                    completion(decodedResponse, nil)
                    print(decodedResponse)
                }
                return
            }
            
        }.resume()
        
    }
}
