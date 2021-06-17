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
    
    @State private var query = ""
    
    var searchNames: [Recipe] {
        if query == "" { return modelData.recipes }
        return modelData.recipes.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
    
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
                    RecipeRow(recipe: recipe)
                        .swipeActions(edge: .trailing) {
                            Button { modelData.toggleFavorite(recipe: recipe)
                            }
                        label: {
                            if recipe.isFavorite {
                                Label("Unfavorite", systemImage: "star.slash.fill")
                            } else {
                                Label("Favorite", systemImage: "star.fill")
                            }
                        }
                        .tint(.yellow)
                        }
                }
                
            }
            .searchable(text: $query)
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
