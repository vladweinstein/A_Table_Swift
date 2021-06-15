//
//  A_TableApp.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/7/21.
//

import SwiftUI

@main
struct A_TableApp: App {
    
    
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
