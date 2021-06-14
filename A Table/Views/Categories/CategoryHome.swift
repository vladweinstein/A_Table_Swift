//
//  CategoryHome.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/8/21.
//

import SwiftUI


struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ScrollView {
                PageView(pages: modelData.features.map { FeatureCard(recipe: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    Divider()
                }
               
            }
            
            .navigationTitle("À Table")
            
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
