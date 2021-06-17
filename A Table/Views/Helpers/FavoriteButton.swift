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
                Image(systemName: isSet ? "star.fill" : "star")
                    .foregroundColor(isSet ? Color.white : Color.white)
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
                    .background(isSet ? Color.yellow : .gray)
                    .cornerRadius(10)
            }
        }
    }

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
