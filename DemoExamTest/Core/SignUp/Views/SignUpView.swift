//
//  ContentView.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Create an account")
                        .robotoFont(size: 24, weigth: .medium)
                        .foregroundStyle(.black)
                    Text("Complete the sign up process to get started")
                        .robotoFont(size: 14, weigth: .medium)
                        .foregroundStyle(.gray)
                    
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}
