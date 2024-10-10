//
//  ForgotPasswordView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var email = ""
    @State private var isProgress = false
    
    @State var connectedError = false
    @State private var error = false
    
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
            
            VStack {
                LabeledTextField(title: "Email Address", placeholder: "***********@mail.com", userInput: $email)
            }
            VStack(spacing: 18) {
                Button("Send OTP") {
                    //
                }.buttonStyle(CustomButtonStyle(progress: isProgress))
                
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
        .alert("Network Error", isPresented: $connectedError) {
            
        }
        .alert("Supabase Erro", isPresented: $error) {
            
        }
    }
}

#Preview {
    ForgotPasswordView()
}
