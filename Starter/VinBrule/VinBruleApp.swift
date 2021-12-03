//
//  VinBruleApp.swift
//  Workshop: Make It For Everyone
//  VinBrule
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI

@main
struct VinBruleApp: App {
    @StateObject private var recipeStore = RecipeStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .colorScheme(.light)
                .environmentObject(recipeStore)
        }
    }
}
