//
//  RecipeRow.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/8/21.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            recipe.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
            Text(recipe.name)
            
            Spacer()
            
            if recipe.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    
    static var previews: some View {
        Group {
            RecipeRow(recipe: recipes[0])
            RecipeRow(recipe: recipes[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
