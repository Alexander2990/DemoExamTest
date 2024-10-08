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
    
    @Binding var text: String
    
    let isSecure: Bool
    @State private var nowIsSecure = true
    
    init(
        label: String,
        placeholder: String,
        text: Binding<String>,
        isSecure: Bool = false
    ) {
        self.label = label
        self.placeholder = placeholder
        self._text = text
        self.isSecure = isSecure
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .robotoFont(size: 14, weight: .bold)
                .foregroundStyle(.gray)
            ZStack(alignment: .trailing) {
                if !isSecure || !nowIsSecure {
                    TextField(placeholder, text: $text)
                        .textFieldStyle(MainTextFieldStyle())
                } else {
                    SecureField(placeholder, text: $text)
                        .textFieldStyle(MainTextFieldStyle())
                }
                
                if isSecure {
                    Button(action: {
                        self.nowIsSecure.toggle()
                    }, label: {
                        Image("eye.slash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                            .padding(.trailing)
                    })
                }
            }
        }
    }
}

#Preview {
    CustomTextField(
        label: "Full Name",
        placeholder: "Some Text",
        text: .constant(""),
        isSecure: true
    ).padding()
}
