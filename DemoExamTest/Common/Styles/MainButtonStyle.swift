//
//  MainButtonStyle.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    let disabled: Bool
    let width: CGFloat?
    let progress: Bool

    init(disabled: Bool = false, width: CGFloat? = nil, progress: Bool = false) {
        self.disabled = disabled
        self.width = width
        self.progress = progress
    }

    func makeBody(configuration: Configuration) -> some View {
        Group {
            if progress {
                ProgressView()
                    .tint(.white)
            } else {
                configuration.label
            }
        }
        .robotoFont(size: 14, weight: .bold)
        .foregroundStyle(.white)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .frame(width: width)
        .background(
            disabled ? Color.gray :
            configuration.isPressed ? Color.accentColor.opacity(0.6) :
            progress ? Color.accentColor : Color.gray
        )
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    Button("Label") {
        // Действие кнопки
    }
    .buttonStyle(MainButtonStyle())
    .padding()
}
