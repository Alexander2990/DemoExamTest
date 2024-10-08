//
//  String.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

// MARK: String
extension String {
    // Регулярные выражаения
    private static let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}$"
    
    func validateEmail() -> Bool {
    
        return self.range(of: String.emailRegex, options: .regularExpression) != nil
    }
}
