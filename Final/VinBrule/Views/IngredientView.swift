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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            // Sets sort priority order for this accessibility element
                .accessibilitySortPriority(2)
            Spacer()
            Button(
                action: {},
                label: {
                    Text("Make")
                        .font(.title2)
                        .padding(.horizontal, 16)
                        .frame(minWidth: 120)
                }
            )
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 8))
            // Adds accessibility label to the view that describes its contents
                .accessibilityLabel("Make Vin Brulé")
            // Communicates to the user what will happen after tapping the button
                .accessibilityHint("You will be able to make an amazing Christmas drink")
                .accessibilitySortPriority(1)
        }
        .background(
            Image(ingredient.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            // Hides this view from system accessibility features
                .accessibilityHidden(true)
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
