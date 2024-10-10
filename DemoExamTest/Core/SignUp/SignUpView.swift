//
//  ContentView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var isTermsAccepted = false
    @State private var isEmailInvalid = false
    @State private var isProgress = false
    @State private var showAlert = false
    
    @StateObject var signUpViewModel = UserRegistrationViewModel()
    
    // Функция проверки заполнения всех полей
    private var isFormValid: Bool {
        return !signUpViewModel.user.name.isEmpty &&
        !signUpViewModel.user.phone.isEmpty &&
        !signUpViewModel.email.isEmpty &&
        !signUpViewModel.password.isEmpty &&
        !signUpViewModel.confirmPassword.isEmpty &&
        signUpViewModel.password == signUpViewModel.confirmPassword &&
        isTermsAccepted
    }
    
    private var termsAndConditionsText: some View {
        VStack {
            (
                Text("By ticking this box, you agree to our ")
                    .foregroundColor(.gray)
                + Text("Terms and Conditions and Privacy Policy")
                    .foregroundColor(.yellow)
                    .underline()
            )
            .applyRobotoFont(size: 12)
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
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Create an account")
                        .applyRobotoFont(size: 24, weight: .medium)
                        .foregroundStyle(.black)
                    
                    Text("Complete the sign up process to get started")
                        .applyRobotoFont(size: 14, weight: .medium)
                        .foregroundStyle(.gray)
                    
                    LabeledTextField(
                        title: "Full name",
                        placeholder: "Ivanov Ivan",
                        userInput: $signUpViewModel.user.name
                    )
                    LabeledTextField(
                        title: "Phone Number",
                        placeholder: "+7(999)999-99-99",
                        userInput: $signUpViewModel.user.phone
                    )
                    LabeledTextField(
                        title: "Email Address",
                        placeholder: "***********@mail.com",
                        userInput: $signUpViewModel.email
                    )
                    LabeledTextField(
                        title: "Password",
                        placeholder: "**********",
                        userInput: $signUpViewModel.password,
                        isPasswordField: true
                    )
                    LabeledTextField(
                        title: "Confirm Password",
                        placeholder: "**********",
                        userInput: $signUpViewModel.confirmPassword,
                        isPasswordField: true
                    )
                }
                
                HStack(alignment: .top, spacing: 10) {
                    StyledCheckBox(isChecked: $isTermsAccepted)
                    
                    termsAndConditionsText
                }
                
                VStack(spacing: 20) {
                    Button(action: {
                        if !signUpViewModel.email.isValidEmail() {
                            isEmailInvalid = true // Показать alert
                        } else {
                            signUpViewModel.signUp() // Выполнить регистрацию, если email валиден
                        }
                    }) {
                        if isProgress {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        } else {
                            Text("Sign Up")
                        }
                    }
                    .buttonStyle(CustomButtonStyle(disabled: !isFormValid))
                    .disabled(!isFormValid) // Блокировка кнопки, если форма невалидна
                    
                    VStack(spacing: 8) {
                        HStack(spacing: 4) {
                            Text("Already have an account?")
                                .applyRobotoFont(size: 14, weight: .regular)
                                .foregroundColor(.gray)
                            
                            NavigationLink(destination: LoginView()) {
                                Text("Sign In")
                                    .applyRobotoFont(size: 14, weight: .medium)
                                    .foregroundColor(.accentColor)
                                    .navigationBarBackButtonHidden(false)
                            }
                        }
                        
                        Text("or sign in using")
                            .applyRobotoFont(size: 14, weight: .regular)
                            .foregroundColor(.gray)
                        
                        Button(action: signInWithGoogle) {
                            Image("iconeGoogle")
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                    }
                }
                NavigationLink(destination: LoginView(), isActive: $signUpViewModel.isNavigateToLogin) {
                    EmptyView()
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .alert("Invalid Email", isPresented: $isEmailInvalid) {
                Button("OK", role: .cancel) { }
            }
        }
        .navigationBarHidden(true)
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

