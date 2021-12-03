//
//  IngredientView.swift
//  Workshop: Make It For Everyone
//  VinBrule
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI


struct IngredientView: View {
    @EnvironmentObject var recipeStore: RecipeStore
    let ingredient: Ingredient

    var body: some View {
        VStack(spacing: 16) {
            IngredientGrid()
            Text(ingredient.quantity)
                .foregroundColor(.white)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Spacer()
            Button(
                action: {},
                label: {
                    Image("sketch-export-Group2")
                }
            )
        }
        .background(
            Image(ingredient.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .navigationTitle("Vin Brulé")
        .navigationBarBackButtonHidden(true)
    }
}

struct IngredientView_Previews: PreviewProvider {
    static let recipeStore = RecipeStore()
    static var previews: some View {
        IngredientView(ingredient: recipeStore.ingredients[0])
            .environmentObject(recipeStore)
    }
}
