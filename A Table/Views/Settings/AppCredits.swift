//
//  AppCredits.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/9/21.
//

import SwiftUI

struct AppCredits: View {
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Text("Developed by Vladimir Weinstein. He loves photography, video games and cooking.")
                    Image("VladimirWeinstein")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .cornerRadius(5)
                    
                }
                .padding(.bottom, 20)
                
                HStack {
                    
                    Image("DanieleWeinstein")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .cornerRadius(5)
                    Text("Recipes authored by Daniele Weinstein. She loves experimenting with food and teaches French.")
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct AppCredits_Previews: PreviewProvider {
    static var previews: some View {
        AppCredits()
    }
}
