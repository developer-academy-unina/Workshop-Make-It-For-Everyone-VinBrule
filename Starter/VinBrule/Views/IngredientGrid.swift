//
//  IngredientGrid.swift
//  Workshop: Make It For Everyone
//  VinBrule
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI


struct IngredientGrid: View {
    @EnvironmentObject var recipeStore: RecipeStore
    var rows: [GridItem] = [GridItem(.fixed(75))]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(recipeStore.ingredients) { ingredient in
                    NavigationLink(
                        destination: {
                            IngredientView(ingredient: ingredient)
                        }
                    ) {
                        VStack {
                            Text(ingredient.emoji)
                                .font(.largeTitle)
                            Text(ingredient.name)
                                .font(.footnote)
                        }
                        .frame(width: 75, height: 75)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.blue.opacity(0.6))
                        )
                    }
                }
            }
        }
        .padding(.horizontal)
        .frame(height: 75)
    }
}

struct IngredientGrid_Previews: PreviewProvider {
    static var previews: some View {
        IngredientGrid()
            .environmentObject(RecipeStore())
    }
}
