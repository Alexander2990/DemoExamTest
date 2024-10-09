//
//  String.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

// MARK: String
extension String {
    // Регулярное выражение для email
    private static let emailValidationPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}$"
    
    func isValidEmail() -> Bool {
    
        self.range(of: Self.emailValidationPattern, options: .regularExpression) != nil
    }
}
