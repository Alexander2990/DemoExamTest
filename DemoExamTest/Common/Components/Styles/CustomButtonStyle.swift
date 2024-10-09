//
//  MainButtonStyle.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    let isDisabled: Bool
    let width: CGFloat?
    let isLoading: Bool
    
    init(disabled: Bool = false, width: CGFloat? = nil, progress: Bool = false) {
        self.isDisabled = disabled
        self.width = width
        self.isLoading = progress
    }
    
    func makeBody(configuration: Configuration) -> some View {
        Group {
            if isLoading {
                ProgressView()
                    .tint(.white)
            } else {
                configuration.label
            }
        }
        .applyRobotoFont(size: 14, weight: .bold)
        .foregroundStyle(.white)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .frame(width: width)
        .background(
            isDisabled ? Color.gray :
                configuration.isPressed ? Color.accentColor.opacity(0.6) :
                    .gray
        )
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    Button("Label") {
        // Действие кнопки
    }
    .buttonStyle(CustomButtonStyle())
    .padding()
}
