//
//  CustomTextField.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct LabeledTextField: View {
    let title: String
    let placeholder: String
    let isPasswordField: Bool
    
    @Binding var userInput : String
    @State private var isPasswordHidden = true
    
    init(
        title: String,
        placeholder: String,
        userInput: Binding<String>,
        isPasswordField: Bool = false
    ) {
        self.title = title
        self.placeholder = placeholder
        self._userInput  = userInput
        self.isPasswordField = isPasswordField
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .applyRobotoFont(size: 14, weight: .bold)
                .foregroundColor(.gray)
            
            ZStack(alignment: .trailing) {
                Group {
                    if isPasswordField && isPasswordHidden {
                        SecureField(placeholder, text: $userInput )
                    } else {
                        TextField(placeholder, text: $userInput )
                    }
                }
                .textFieldStyle(CustomTextFieldStyle())
                
                if isPasswordField {
                    Button(action: {
                        isPasswordHidden.toggle()
                    }) {
                        Image(systemName: isPasswordHidden ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing)
                }
            }
        }
    }
}

struct LabeledTextField_Previews: PreviewProvider {
    static var previews: some View {
        LabeledTextField(
            title: "Password",
            placeholder: "Enter password",
            userInput: .constant(""),
            isPasswordField: true
        )
        .padding()
    }
}
