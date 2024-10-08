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
                    CustomTextField(label: "Full name", placeholder: "Ivanov Ivan", text: $name)
                    CustomTextField(label: "Phone Number", placeholder: "+7(999)999-99-99", text: $phone)
                    CustomTextField(label: "Email Address", placeholder: "***********@mail.com", text: $email)
                    CustomTextField(label: "Password", placeholder: "**********", text: $password, isSecure: true)
                    CustomTextField(label: "Confirm Password", placeholder: "**********", text: $confirmPassword, isSecure: true)
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}
