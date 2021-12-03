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
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var rows: [GridItem] = [GridItem(.fixed(90))]

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
                                .layoutPriority(100)
                                .font(.largeTitle)
                                .accessibilityHidden(true)
                            // Hides text when the size is associated with accessibility
                            if !dynamicTypeSize.isAccessibilitySize {
                                Text(ingredient.name)
                                    .foregroundColor(.black)
                                    .fontWeight(.medium)
                            }
                        }
                        .frame(width: 90, height: 90)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.blue.opacity(0.6))
                        )
                        // Modifies accessibility behavior of its children. With .ignore behavior all child accessibility elements become hidden
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(ingredient.name)
                    }
                }
            }
        }
        .padding(.leading)
        .frame(height: 90)
    }
}

struct IngredientGrid_Previews: PreviewProvider {
    static var previews: some View {
        IngredientGrid()
            .environmentObject(RecipeStore())
    }
}
