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
                .ignoresSafeArea(edges: .top)
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
                
                Divider()
                
                VStack {Text("Ingredients (scroll to view all)")
                    .font(.subheadline)
                    
                    List {
                        Text(recipe.ingredients)
                            
                            .padding(.horizontal, 30)
                    }
                    .frame(height: 105)
                    
                    Divider()
                    
                    VStack {
                        Text("Directions")
                            .font(.subheadline)
                            .padding(.bottom, 5)
                        Text(recipe.description)
                    }
                    
                    .padding(.horizontal, 30)
                }
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
