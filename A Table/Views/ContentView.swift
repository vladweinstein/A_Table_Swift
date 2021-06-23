//
//  ContentView.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/7/21.
//

import SwiftUI


struct ContentView: View {
    
    @State private var tabSelection = 1
    @State private var tappedTwice: Bool = false
    
    @State private var featured = UUID()
    @State private var list = UUID()
    @State private var settings = UUID()
    
    var body: some View {
        var handler: Binding<Int> { Binding(
            get: { self.tabSelection },
            set: {
            if $0 == self.tabSelection {
                // Lands here if user tapped more than once
                tappedTwice = true
            }
            self.tabSelection = $0
        }
        )}
        
        return TabView(selection: handler) {
            
            CategoryHome()
                .id(featured)
                .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    featured = UUID()
                    self.tappedTwice = false
                })
            
                .tabItem {
                    Image(systemName: "fork.knife.circle")
                    Text("Home")
                }
                .tag(1)
       
            
            
            RecipeList()
                .id(list)
                .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    list = UUID()
                    self.tappedTwice = false
                })
            
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Recipes")
                }
                .tag(2)
            
            
            SettingsPage()
                .id(settings)
                .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    settings = UUID()
                    self.tappedTwice = false
                })
            
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(3)
        }
        .accentColor(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
