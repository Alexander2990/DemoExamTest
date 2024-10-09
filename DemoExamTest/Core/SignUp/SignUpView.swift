//
//  ContentView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var userName = ""
    @State private var phoneNumber = ""
    @State private var emailAddres = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var isTermsAccepted = false
    
    @State private var isEmailInvalid = false
    
    @State private var isProgress = false
    
    @StateObject var userViewModel = UserViewModel()
    
    private var termsAndConditionsText: some View {
        
            VStack {
                (
                    Text("By ticking this box, you agree to our ")
                        .foregroundColor(.gray)
                    + Text("Terms and Conditions and Privacy Policy")
                        .foregroundColor(.yellow)
                        .underline()
                )
                .robotoFont(size: 12)
                .multilineTextAlignment(.center)
                .onTapGesture {
                    if let url = URL(string: "https://developer.apple.com/") {
                        openURL(url)
                    }
                }
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 50) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Create an account")
                        .robotoFont(size: 24, weight: .medium)
                        .foregroundStyle(.black)
                    
                    Text("Complete the sign up process to get started")
                        .robotoFont(size: 14, weight: .medium)
                        .foregroundStyle(.gray)
                    
                    CustomTextField(
                        label: "Full name",
                        placeholder: "Ivanov Ivan",
                        text: $userViewModel.user.name
                    )
                    CustomTextField(
                        label: "Phone Number",
                        placeholder: "+7(999)999-99-99",
                        text: $userViewModel.user.phone
                    )
                    CustomTextField(
                        label: "Email Address",
                        placeholder: "***********@mail.com",
                        text: $userViewModel.email
                    )
                    CustomTextField(
                        label: "Password",
                        placeholder: "**********",
                        text: $userViewModel.password,
                        isSecure: true
                    )
                    CustomTextField(
                        label: "Confirm Password",
                        placeholder: "**********",
                        text: $userViewModel.confirmPassword,
                        isSecure: true
                    )
                }
                
                HStack(alignment: .top, spacing: 10) {
                    CustomCheckBox(isChecked: $isTermsAccepted)
                    
                    termsAndConditionsText
                }
                
                VStack(spacing: 20) {
                    Button(action: userViewModel.signUp) {
                        if isProgress {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        } else {
                            Text("Sign Up")
                        }
                    }
                    .buttonStyle(MainButtonStyle())
                    
                    VStack(spacing: 8) {
                        HStack(spacing: 4) {
                            Text("Already have an account?")
                                .robotoFont(size: 14, weight: .regular)
                                .foregroundColor(.gray)
                            
                            NavigationLink(destination: LogInView()) {
                                Text("Sign In")
                                    .robotoFont(size: 14, weight: .medium)
                                    .foregroundColor(.accentColor)
                                    .navigationBarBackButtonHidden(false)
                            }
                        }
                        
                        Text("or sign in using")
                            .robotoFont(size: 14, weight: .regular)
                            .foregroundColor(.gray)
                        
                        Button(action: signInWithGoogle) {
                            Image("iconeGoogle")
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                    }
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .alert("Email Error", isPresented: $isEmailInvalid) {
                Button("OK", role: .cancel) { }
            }
        }
        .navigationBarHidden(true)
    }
    
    
    
    private func signUp() {
        // Валидация email
        if !emailAddres.validateEmail() {
            isEmailInvalid = true
            return
        }
        
        // Начало процесса регистрации
        isProgress = true
        
        // Имитация процесса регистрации
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isProgress = false
            // Логика после успешной регистрации
        }
    }
    
    private func signInWithGoogle() {
        // Логика входа через Google
    }
}

#Preview {
    NavigationView {
        SignUpView()
    }
}

