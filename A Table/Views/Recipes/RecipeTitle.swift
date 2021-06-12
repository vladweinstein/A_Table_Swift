//
//  RecipeTitle.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/11/21.
//

import SwiftUI

struct RecipeTitle: View {
    @EnvironmentObject var modelData: ModelData
    var recipe: Recipe
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.yellow)
                .frame(width: 300, height: 75)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack{
            HStack{
                Text(recipe.name)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.leading, -60.0)
            }
            HStack{
                Text(recipe.meat)
                Spacer()
                Text(recipe.cookTime)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding(.horizontal, 70)
            }
        }
    }
}

struct RecipeTitle_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeTitle(recipe: modelData.recipes[0])
            .environmentObject(modelData)
    }
}
