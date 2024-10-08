//
//  SwiftUIView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct MainTextFieldStyle: TextFieldStyle {
    
    let width: CGFloat?
    
    init(width: CGFloat? = nil) {
        self.width = width
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .robotoFont(size: 14, weight: .medium)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .frame(width: width, height: 45)
            .padding(.leading)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 1)
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
