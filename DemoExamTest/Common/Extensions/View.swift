//
//  View.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

extension Font.Weight {
    var robotoFontName: String {
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
    func robotoFont(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        self.font(.custom(weight.robotoFontName, size: size))
    }
}
