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
    
    var filteredRecipes: [Recipe] {
        modelData.recipes.filter { recipe in
            if showFavoritesOnly {
                if !recipe.isFavorite {
                    return false
                }
            }
            
            if query == "" { return true }
            else {
                return recipe.name.lowercased().contains(query.lowercased())
            }
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
                .accessibilityHint("Tap to view recipe")
                
            }
            .searchable(text: $query)
            .navigationTitle("Recipes")
        }
        
    }
}

struct RecipeList_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipeList()
            .environmentObject(ModelData())
    }
}
