//
//  Checkbox.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/21/21.
//

import SwiftUI

struct Checkbox: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.circle" : "circle")
            .foregroundColor(checked ? Color(UIColor.systemYellow) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct Checkbox_Previews: PreviewProvider {
    struct CheckboxHolder: View {
        @State var checked = false

        var body: some View {
            Checkbox(checked: $checked)
        }
    }

    static var previews: some View {
        CheckboxHolder()
    }
}
