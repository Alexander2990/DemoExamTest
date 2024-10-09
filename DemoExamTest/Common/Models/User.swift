//
//  UserModel.swift
//  DemoExamTest
//
//  Created by Александр on 09.10.2024.
//

import Foundation

struct User: Codable {
    var id: UUID = UUID()
    var name: String
    var phone: String
    var created_at: Date
}
