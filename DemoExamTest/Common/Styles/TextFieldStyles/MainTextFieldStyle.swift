//
//  SwiftUIView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct MainTextFieldStyle: TextFieldStyle {
    let width: CGFloat? = nil

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .robotoFont(size: 14, weight: .medium)
            .foregroundColor(.black)
            .frame(height: 45)
            .frame(maxWidth: width == nil ? .infinity : nil)
            .frame(width: width)
            .padding(.leading)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    TextField("Text", text: .constant(""))
        .textFieldStyle(MainTextFieldStyle())
        .padding()
}
