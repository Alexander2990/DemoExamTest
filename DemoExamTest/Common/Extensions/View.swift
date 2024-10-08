//
//  View.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

// MARK: View
extension View {
    
    // расширение для шрифта Roboto
    func robotoFont(size: CGFloat, weigth: Font.Weight = .regular) -> some View {
        switch weigth {
        case .bold:
            self
                .font(.custom("Roboto Bold", size: size))
        case .black:
            self
                .font(.custom("Roboto Black", size: size))
        case .medium:
            self
                .font(.custom("Roboto Medium", size: size))
        default:
            self
                .font(.custom("Roboto Regular", size: size))
        }
    }
}
