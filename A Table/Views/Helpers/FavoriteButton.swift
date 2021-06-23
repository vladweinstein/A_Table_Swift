//
//  FavoriteButton.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/8/21.
//


import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button(action: {
                isSet.toggle()
            }) {
                Image(systemName:"star.circle")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(isSet ? .yellow : .gray)
                    .imageScale(.large)
                    .scaleEffect(isSet ? 1.2 : 1.1)
            }
        }
    }

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
