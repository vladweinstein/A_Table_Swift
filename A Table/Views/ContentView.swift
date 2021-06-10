//
//  ContentView.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/7/21.
//

import SwiftUI

struct ContentView: View {
   
    @State private var selection: Tab = .featured
    

    enum Tab {
        case featured
        case list
        case settings
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Home", systemImage: "house")
                       
                }
                .tag(Tab.featured)

            RecipeList()
                .tabItem {
                    Label("Recipes", systemImage: "books.vertical")
                }
                .tag(Tab.list)
            
            SettingsPage()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
