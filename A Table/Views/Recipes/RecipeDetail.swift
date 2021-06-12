//
//  RecipeDetail.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/8/21.
//

import SwiftUI

struct RecipeDetail: View {
    @EnvironmentObject var modelData: ModelData
    var recipe: Recipe
    
    var recipeIndex: Int {
        modelData.recipes.firstIndex(where: { $0.id == recipe.id })!
    }
    
    var body: some View {
        ScrollView {
            RectangleImage(image: recipe.image)
                .frame(height: 410)
                .offset(y: -100)
                .padding(.bottom, -160)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(recipe.name)
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding(.leading, 20.0)
                    FavoriteButton(isSet: $modelData.recipes[recipeIndex].isFavorite)
                }
                
                HStack {
                    Text(recipe.meat)
                    Spacer()
                    Text(recipe.cookTime)
                    
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal, 20)
                
                
                List {
                    Text("Ingredients (scroll to view all)")
                        .font(.subheadline)
                    Text(recipe.ingredients)
                    
                }
                
                .frame(height: 150)
                
                
                VStack {
                    Text("Directions")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                        .padding(.top, 10)
                    Text(recipe.description)
                }
                
                .padding(.horizontal, 30)
                
            }
            .padding()
            
        }
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeDetail(recipe: modelData.recipes[0])
            .environmentObject(modelData)
    }
}
