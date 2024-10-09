//
//  CheckBox.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct StyledCheckBox: View {
    
    @Binding var isChecked: Bool

    var body: some View {
        
        Button (action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 14, height: 14)
                .foregroundColor(isChecked ? .blue : .gray)
        }
    }
}

#Preview {
    StyledCheckBox(isChecked: .constant(true))
}
