//
//  View.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

extension Font.Weight {
    var robotoName: String {
        switch self {
        case .black:
            return "Roboto-Black"
        case .bold:
            return "Roboto-Bold"
        case .medium:
            return "Roboto-Medium"
        default:
            return "Roboto-Regular"
        }
    }
}

extension View {
    func applyRobotoFont(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        self.font(.custom(weight.robotoName, size: size))
    }
}
