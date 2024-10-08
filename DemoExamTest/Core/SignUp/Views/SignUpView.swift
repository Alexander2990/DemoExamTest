//
//  ContentView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var checkBox = false
    
    @State private var emailError: Bool = false
    @State var isNavigate: Bool = false
    
    @State private var isProgress: Bool = false
    
    var body: some View {
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
                    text: $name
                )
                CustomTextField(
                    label: "Phone Number",
                    placeholder: "+7(999)999-99-99",
                    text: $phone
                )
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
                CustomTextField(
                    label: "Confirm Password",
                    placeholder: "**********",
                    text: $confirmPassword,
                    isSecure: true
                )
            }
            
            HStack(alignment: .top, spacing: 10) {
                CheckBox(isChecked: $checkBox)
                
                Link(destination: URL(string: "https://developer.apple.com/")!) {
                    Text("\(Text("By ticking this box, you agree to our").foregroundColor(.gray)) \(Text("Terms and conditions and private policy").foregroundColor(.yellow))")
                        .robotoFont(size: 12)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            VStack(spacing: 17) {
                Button("Sign Up") {
                    print("Email error!")
                }
                .buttonStyle(MainButtonStyle(progress: isProgress))
                
                VStack(spacing: 7) {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                            .robotoFont(size: 14, weight: .regular)
                            .foregroundColor(.gray)
                        NavigationLink {
                            LogInView()
                        } label: {
                            Text("Sign In")
                                .robotoFont(size: 14, weight: .medium)
                                .foregroundColor(Color.accentColor)
                        }
                    }
                    
                    Text("or sign in using")
                        .robotoFont(size: 14, weight: .regular)
                        .foregroundColor(.gray)
                    
                    Image("iconeGoogle")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            
            NavigationLink(
                destination: LogInView(),
                isActive: $isNavigate,
                label: {
                    EmptyView()
                })
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .alert("Email Error", isPresented: $emailError) {
        }
    }
}

#Preview {
    NavigationView {
        SignUpView()
    }
}
