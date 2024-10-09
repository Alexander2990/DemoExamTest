//
//  UserViewModel.swift
//  DemoExamTest
//
//  Created by Александр on 09.10.2024.
//

import Foundation

class UserRegistrationViewModel: ObservableObject{
    
    @Published var user = User(id: UUID(), name: "", phone: "", created_at: .now)
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @Published var isProgress = false
    @Published var isNavigate = false
    @Published var error = false
    @Published var errorMessage = ""
    
    func signUp() {
        
        Task {
            do {
                // Проверка валидации email
                guard email.isValidEmail() else {
                    await MainActor.run {
                        self.errorMessage = "Invalid email format"
                        self.error = true
                    }
                    return
                }
                await MainActor.run {
                    self.isProgress = true
                }
                try await UserRepository.instance.registerUser(
                    name: user.name,
                    phone: user.phone,
                    email: email,
                    password: password
                )
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
