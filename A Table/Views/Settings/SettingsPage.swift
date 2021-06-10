//
//  SettingsPage.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/9/21.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        NavigationView {
            
            List {
                NavigationLink(destination: LegalText()) {
                    Label("Legal", systemImage: "doc.text.magnifyingglass")
                }
                NavigationLink(destination: AppCredits()) {
                    Label("App Credits", systemImage: "chevron.left.slash.chevron.right")
                }
                NavigationLink(destination: RecipeRequest()) {
                    Label("Request Recipe", systemImage: "square.and.pencil")
                }

            }
            .navigationTitle("Settings")
            Spacer()
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
            
    }
}
