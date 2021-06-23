//
//  CategoryHome.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/8/21.
//

import SwiftUI

private func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 0..<4:
            return "Hello"
        case 4..<12:
            return "Good morning"
        case 12..<18:
            return "Good afternoon"
        case 18..<24:
            return "Good evening"
        default:
            break
        }
        return "Hello"
    }

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
            
            .navigationTitle(getGreeting())
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
