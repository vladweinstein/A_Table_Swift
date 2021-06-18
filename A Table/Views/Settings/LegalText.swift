//
//  LegalText.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/9/21.
//

import SwiftUI

struct LegalText: View {
    var body: some View {
        ScrollView {
            
            Text("The ingredients and cook times described throughout this application are specific to the ingredients used during recipe testing. Always use  ingredients within their posted expiry date and check cook temperatures using a thermometer, comparing safe temperatures to posted numbers from your local food & safety agencies . Expirement at your own will. We are not held liable for any nauseating experiences that may occur due to consumption of raw, expired or similar foods that may be ill-advised in consuming otherwise.\n\nAnd whatever you do, don't go for the 'fresh' salmon while in West Texas.").padding(30)
            
        }
        .navigationBarTitle("Legal", displayMode: .inline)
        .padding(.top, -10)
    }
}


struct LegalText_Previews: PreviewProvider {
    static var previews: some View {
        LegalText()
    }
}
