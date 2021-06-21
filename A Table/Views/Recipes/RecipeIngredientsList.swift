//
//  RecipeIngredientsList.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/19/21.
//

import SwiftUI

struct RecipeIngredientsList: View {
    @EnvironmentObject var modelData: ModelData
    
    var recipe: Recipe
    
    var body: some View {
        List {
            Section(header: Text("Scroll to view all ingredients")) {
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
                .padding([.leading, .top, .bottom], 10)
                
            }
        }
        .cornerRadius(10)
        .frame(height: 300)
        .transition(.moveAndFade)
    }
}

struct RecipeIngredientsList_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeIngredientsList(recipe: modelData.recipes[0])
            .environmentObject(modelData)
    }
}
