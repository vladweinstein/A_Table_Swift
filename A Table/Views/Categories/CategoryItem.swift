//
//  CategoryItem.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/8/21.
//

import SwiftUI

struct CategoryItem: View {
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            recipe.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 200, height: 150)
                .cornerRadius(5)
            Text(recipe.name)
                .foregroundColor(.primary)
                .font(.body)
        }
        .padding(.leading, 15)
        .padding(.bottom, 10)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(recipe: ModelData().recipes[0])
    }
}
