//
//  ContentView.swift
//  Workshop: Make It For Everyone
//  VinBrule
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var recipeStore: RecipeStore
    
    var body: some View {
        NavigationView {
            IngredientView(ingredient: recipeStore.ingredients[0])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeStore())
    }
}
