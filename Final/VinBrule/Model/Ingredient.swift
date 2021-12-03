//
//  Ingredient.swift
//  Workshop: Make It For Everyone
//  VinBrule
//
//  Created by Vasily Martin for Developer Academy
//

import Foundation

/// Ingredient stores data for a particular ingredient of recipe
struct Ingredient: Identifiable, Decodable {
    let id: Int
    let name: String
    let emoji: String
    let image: String
    let quantity: String
}
