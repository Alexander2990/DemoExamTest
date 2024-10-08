//
//  CheckBox.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct CheckBox: View {
    
    @Binding var isChecked: Bool

    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .foregroundStyle(isChecked ? .blue : .gray)
                .frame(width: 14, height: 14)
        }
    }
}

#Preview {
    CheckBox(isChecked: .constant(true))
}
