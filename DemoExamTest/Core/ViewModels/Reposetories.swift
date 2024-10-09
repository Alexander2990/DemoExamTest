//
//  Reposetories.swift
//  DemoExamTest
//
//  Created by Александр on 09.10.2024.
//

import Foundation
import Supabase

class Repositories {
    // паттерн instance
    static let instance = Repositories()
    
    // подключение supabase
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://hcyffmtuuraenpdishjt.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhjeWZmbXR1dXJhZW5wZGlzaGp0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0NTQwMzQsImV4cCI6MjA0NDAzMDAzNH0.nS52Tk-xPsQu8fyWBFsgmHopW5HkgSBBtmt_LoyFETM",
        options: .init())
    
    // регистрация в supabase
    func signUp(name: String, phone: String, email: String, password: String) async throws {
        try await supabase.auth.signUp(email: email, password: password)
        
        let user = try await supabase.auth.session.user
        
        let newUser = UserModel(id: user.id, name: name, phone: phone, created_at: .now)
        
        try await supabase.from("users")
            .insert(newUser)
            .execute()
        
        try await supabase.auth.signOut()
    }
}
