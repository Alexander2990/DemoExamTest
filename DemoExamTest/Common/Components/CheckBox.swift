//
//  CheckBox.swift
//  DemoExamTest
//
//  Created by Александр on 08.10.2024.
//

import SwiftUI

struct CheckBox: View {
    
    @Binding var value: Bool
    
    var body: some View {
        Group {
            if value {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.blue)
                    .frame(width: 14, height: 14)
                    .overlay {
                        if value {
                            Image("square")
                                .resizable()
                                .frame(width: 8, height: 8)
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.accentColor, lineWidth: 2)
                    .frame(width: 14, height: 14)
            }
        }
        .onTapGesture {
            self.value.toggle()
        }
    }
}

#Preview {
    CheckBox(value: .constant(true))
}
