//
//  UserModel.swift
//  DemoExamTest
//
//  Created by Александр on 09.10.2024.
//

import Foundation

import Foundation

struct UserModel: Codable {
    var id: UUID
    var name: String
    var phone: String
    var created_at: Date
}
