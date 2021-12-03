//
//  RecipeStore.swift
//  Workshop: Make It For Everyone
//  VinBrule
//
//  Created by Vasily Martin for Developer Academy
//

import Foundation

class RecipeStore: ObservableObject {
    @Published var ingredients: [Ingredient] = load("VinBrule.json")

    /// Decode JSON from the app bundle
    /// This func stops app execution if reading from the file fails, or if the data read is corrupted or otherwise invalid.
    /// - Returns: A value of the requested type
    static func load<T: Decodable>(_ filename: String) -> T {
        guard
            let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
