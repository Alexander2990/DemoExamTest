//
//  LogInView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct LogInView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var regestrationPassword = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Welcome Back")
                    .robotoFont(size: 24, weight: .medium)
                    .foregroundStyle(.black)
                Text("Fill in your email and password to continue")
                    .robotoFont(size: 14, weight: .medium)
                    .foregroundStyle(.gray)
            }
            
            VStack {
                CustomTextField(
                    label: "Email Address",
                    placeholder: "***********@mail.com",
                    text: $email
                )
                CustomTextField(
                    label: "Password",
                    placeholder: "**********",
                    text: $password,
                    isSecure: true
                )
            }
            
            HStack {
                HStack(alignment: .center, spacing: 5) {
                    CheckBox(isChecked: $regestrationPassword)
                    Text("Remember password")
                        .robotoFont(size: 14, weight: .medium)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                NavigationLink {
                    ForgotPasswordView()
                } label: {
                    Text("Forgot password?")
                        .robotoFont(size: 12, weight: .bold)
                        .foregroundColor(Color.accentColor)
                }

            }
        }
    }
}

#Preview {
    LogInView()
}
