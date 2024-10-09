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
    
    @State private var isLogginIn = false
    @State private var shouldNavigateToHome = false
    
    @State private var isRememberPassword = false
    
    private var headerSection: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Welcome Back")
                .robotoFont(size: 24, weight: .medium)
                .foregroundStyle(.black)
            Text("Fill in your email and password to continue")
                .robotoFont(size: 14, weight: .medium)
                .foregroundStyle(.gray)
        }
    }
    
    private var inputFields: some View {
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
    }
    
    private var optionsSection: some View {
        HStack {
            HStack(alignment: .center, spacing: 5) {
                CheckBox(isChecked: $isRememberPassword)
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
    
    private var actionButtons: some View {
        VStack(spacing: 20) {
            Button("Log in") {
                print("Error")
            }
            .buttonStyle(MainButtonStyle(progress: isLogginIn))
            
            VStack(spacing: 8) {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                        .robotoFont(size: 14, weight: .regular)
                        .foregroundColor(.gray)
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(Color.accentColor)
                            .robotoFont(size: 14, weight: .medium)
                    }
                    .foregroundColor(Color.accentColor)
                    .tint(Color.accentColor)
                }
                
                Text("or sign in using")
                    .robotoFont(size: 14, weight: .regular)
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
            actionButtons
            navigationLinkToHome
        }
        .navigationBarHidden(true)
        .padding(.vertical, 5)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func logIn() {
        // Логика входа
        isLogginIn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLogginIn = false
            shouldNavigateToHome = true
        }
    }
    
    private func signInWithGoogle() {
        //Логика входа через Google
    }
}

#Preview {
    LogInView()
}
