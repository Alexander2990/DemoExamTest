//
//  MainButtonStyle.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

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
        if progress {
            ProgressView()
                .tint(.white)
                .robotoFont(size: 14, weight: .bold)
                .foregroundStyle(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .frame(width: width)
                .background(disabled ? .gray : configuration.isPressed ? .accentColor.opacity(0.6) : .accentColor)
                .clipShape(.rect(cornerRadius: 5))
        } else {
            configuration.label
                .robotoFont(size: 14, weight: .bold)
                .foregroundStyle(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .frame(width: width)
                .background(disabled ? .gray : configuration.isPressed ? .accentColor.opacity(0.6) : .gray)
                .clipShape(.rect(cornerRadius: 5))
        }
    }
}

#Preview {
    Button("Label") {
        
    }
    .buttonStyle(MainButtonStyle())
    .padding()
}
