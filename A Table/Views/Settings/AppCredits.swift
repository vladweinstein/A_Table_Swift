//
//  AppCredits.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/9/21.
//

import SwiftUI

struct AppCredits: View {
    var body: some View {
        List{
           
                Section(header: Text("Developer & Photographer")) {
                HStack {
                    Text("Developed in SwiftUI by Vladimir Weinstein. www.vladw.com")
                    Image("VladimirWeinstein")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                        .frame(height: 150)
                        
                }
                }
              
                Section(header: Text("chef & French Teacher")) {
                HStack {
                    
                    Image("DanieleWeinstein")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                        .frame(height: 150)
                        
                    Text("Recipes authored and tested by Daniele Weinstein.")
                }
                
            }
            
        }
    }
}

struct AppCredits_Previews: PreviewProvider {
    static var previews: some View {
        AppCredits()
    }
}
