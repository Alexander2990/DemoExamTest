//
//  String.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import Foundation

// MARK: String
extension String {
    
//    расширение для валидации String
    func validateEmail() -> Bool {
        let emailRegex = "^[a-za-z0-9._%+-]+@[a-za-z0-9.-]+\\.[a-za-z]{2,3}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: self)
    }
}
