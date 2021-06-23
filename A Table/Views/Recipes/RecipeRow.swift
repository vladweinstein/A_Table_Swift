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
        NavigationLink(destination: RecipeDetail(recipe: recipe)) {
        HStack {
            recipe.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .cornerRadius(5)
                
            Text(recipe.name)
            
            Spacer()
            
            if recipe.isFavorite {
                Image(systemName:"star.circle")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.yellow)
                    .imageScale(.large)
            }
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
