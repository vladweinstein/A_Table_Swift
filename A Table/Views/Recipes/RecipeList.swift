//
//  RecipeList.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/8/21.
//

import SwiftUI

struct RecipeList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredRecipes: [Recipe] {
        modelData.recipes.filter { recipe in
            (!showFavoritesOnly || recipe.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly.animation(.spring())) {
                    Text("Show favorites only")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .padding(10)
                ForEach(filteredRecipes) { recipe in
                    NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                        RecipeRow(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
           Spacer()
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipeList()
            .environmentObject(ModelData())
    }
}
