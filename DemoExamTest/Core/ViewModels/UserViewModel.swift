//
//  UserViewModel.swift
//  DemoExamTest
//
//  Created by Александр on 09.10.2024.
//

import Foundation

class UserViewModel: ObservableObject{
    
    @Published var user = UserModel(id: UUID(), name: "", phone: "", created_at: .now)
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @Published var isProgress = false
    @Published var isNavigate = false
    @Published var error = false
    
    func signUp() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await Repositories.instance.signUp(name: user.name, phone: user.phone, email: email, password: password)
                await MainActor.run {
                    self.isNavigate = true
                    self.isProgress = false
                }
            } catch {
                print("ERROR: " + error.localizedDescription)
                await MainActor.run {
                    self.error = true
                    self.isProgress = false
                }
            }
        }
    }
    
}
