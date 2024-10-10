//
//  ForgotPasswordView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var email = ""
    @State private var isLoading = false
    
    @State private var isErrorPresented = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 40) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Forgot Password")
                    .applyRobotoFont(size: 24, weight: .medium)
                    .foregroundStyle(.black)
                Text("Enter your email address")
                    .applyRobotoFont(size: 14, weight: .medium)
                    .foregroundStyle(.gray)
            }
            
            
            LabeledTextField(
                title: "Email Address",
                placeholder: "***********@mail.com",
                userInput: $email
            )
            
            VStack(spacing: 18) {
                Button("Send OTP") {
                    // Логика
                }.buttonStyle(CustomButtonStyle(isLoading: isLoading))
                
                VStack(spacing: 6) {
                    HStack(spacing: 4) {
                        Text("Remember password? Back to")
                            .applyRobotoFont(size: 14, weight: .regular)
                            .foregroundColor(.gray)
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("Sign In")
                                .foregroundColor(.accentColor)
                                .applyRobotoFont(size: 14, weight: .medium)
                        }
                        .foregroundColor(.accentColor)
                        .tint(.accentColor)
                    }
                }
            }
            
            
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarHidden(true)
    }
}


#Preview {
    ForgotPasswordView()
}
