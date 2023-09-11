//
//  JsonReading.swift
//  BenificiariesAppApp
//
//  Created by Ahmad Qasim on 9/9/23.
//

import Foundation

final class JsonPareser {
    
    func parseJson(fileName: String) -> [Benificiary] {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let beneficiaries = try decoder.decode([Benificiary].self, from: data)
                return beneficiaries
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Failed to find JSON file in the app bundle.")
        }
        
        return []
    }
}
