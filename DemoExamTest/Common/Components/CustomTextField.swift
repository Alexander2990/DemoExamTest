//
//  CustomTextField.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct CustomTextField: View {
    let label: String
    let placeholder: String
    let isSecure: Bool
    
    @Binding var text: String
    @State private var isTextHidden = true
    
    init(label: String, placeholder: String, text: Binding<String>, isSecure: Bool = false) {
        self.label = label
        self.placeholder = placeholder
        self._text = text
        self.isSecure = isSecure
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .robotoFont(size: 14, weight: .bold)
                .foregroundColor(.gray)
            
            ZStack(alignment: .trailing) {
                Group {
                    if isSecure && isTextHidden {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                    }
                }
                .textFieldStyle(MainTextFieldStyle())
                
                if isSecure {
                    Button(action: {
                        isTextHidden.toggle()
                    }) {
                        Image(systemName: isTextHidden ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                }
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            label: "Пароль",
            placeholder: "Введите пароль",
            text: .constant(""),
            isSecure: true
        )
        .padding()
    }
}
