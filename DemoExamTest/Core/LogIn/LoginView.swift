//
//  LogInView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var isLoggingIn = false
    @State private var shouldNavigateToHome = false
    
    @State private var isRememberingPassword = false
    
    private var headerSection: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Welcome Back")
                .applyRobotoFont(size: 24, weight: .medium)
                .foregroundStyle(.black)
            Text("Fill in your email and password to continue")
                .applyRobotoFont(size: 14, weight: .medium)
                .foregroundStyle(.gray)
        }
    }
    
    private var inputFields: some View {
        VStack {
            LabeledTextField(
                title: "Email Address",
                placeholder: "***********@mail.com",
                userInput: $email
            )
            LabeledTextField(
                title: "Password",
                placeholder: "**********",
                userInput: $password,
                isPasswordField: true
            )
        }
    }
    
    private var optionsSection: some View {
        HStack {
            HStack(alignment: .center, spacing: 5) {
                StyledCheckBox(isChecked: $isRememberingPassword)
                Text("Remember password")
                    .applyRobotoFont(size: 14, weight: .medium)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            NavigationLink {
                ForgotPasswordView()
            } label: {
                Text("Forgot password?")
                    .applyRobotoFont(size: 12, weight: .bold)
                    .foregroundColor(Color.accentColor)
            }
            
        }
    }
    
    private var actionButtons: some View {
        VStack(spacing: 20) {
            Button("Log in") {
                print("Error")
            }
            .buttonStyle(CustomButtonStyle(progress: isLoggingIn))
            
            VStack(spacing: 8) {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                        .applyRobotoFont(size: 14, weight: .regular)
                        .foregroundColor(.gray)
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(Color.accentColor)
                            .applyRobotoFont(size: 14, weight: .medium)
                    }
                    .foregroundColor(Color.accentColor)
                    .tint(Color.accentColor)
                }
                
                Text("or sign in using")
                    .applyRobotoFont(size: 14, weight: .regular)
                    .foregroundColor(.gray)
                
                Image("iconeGoogle")
                    .resizable()
                    .frame(width: 16, height: 16)
            }
        }
    }
    
    private var navigationLinkToHome: some View {
        NavigationLink(
            destination: HomeView(),
            isActive: $shouldNavigateToHome,
            label: {
                EmptyView()
            })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            headerSection
            inputFields
            optionsSection
            
            Spacer().frame(height: 10)
            
            actionButtons
            navigationLinkToHome
        }
        .navigationBarHidden(true)
        .padding(.vertical, 5)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func performLogin() {
        // Логика входа
        isLoggingIn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoggingIn = false
            shouldNavigateToHome = true
        }
    }
    
    private func signInWithGoogle() {
        //Логика входа через Google
    }
}

#Preview {
    LoginView()
}
