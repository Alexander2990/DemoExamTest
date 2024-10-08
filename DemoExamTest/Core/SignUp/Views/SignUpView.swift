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
    
    @State private var isProgress: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                VStack(alignment: .leading, spacing: 5) {
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
                
                HStack(alignment: .top, spacing: 25) {
                    CheckBox(value: $checkBox)
                    
                    Link(destination: URL(string: "https://developer.apple.com/")!) {
                        Text("\(Text("By ticking this box, you agree to our").foregroundColor(.gray)) \(Text("Terms and conditions and private policy").foregroundColor(.yellow))")
                            .robotoFont(size: 12)
                    }
                }
                VStack(spacing: 17) {
                    Button("Sign Up") {
//                        send()
                    }
                    .buttonStyle(MainButtonStyle(progress: isProgress))
                    
                    VStack(spacing: 7) {
                        HStack(spacing: 3) {
                            Text("Already have an account?")
                                .robotoFont(size: 14, weight: .regular)
                                .foregroundColor(.gray)
                            NavigationLink {
//                                LogInView()
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
            }
        }
    }
}

#Preview {
    SignUpView()
}
