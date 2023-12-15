//
//  CustomButton.swift
//  SwiftUIHelper
//
//  Created by Noah Iarrobino on 12/14/23.
//

import Foundation
import SwiftUI

/// Custom Button
public struct CustomButton: View {
    
    private static let buttonHorizontalMargins: CGFloat = 0
    
    var backgroundColor: Color
    var foregroundColor: Color
    var borderColor: Color?
    var inverted: Bool
    
    private let title: String
    private let action: () -> Void
    
    // It would be nice to make this into a binding.
    private let disabled: Bool
    
    var border: Color {
        if let color: Color = borderColor {
            return color
        }
        
        return inverted ? foregroundColor : .clear
    }
    
    public init(
         title: String,
         disabled: Bool = false,
         inverted: Bool = false,
         backgroundColor: Color = .purple,
         foregroundColor: Color = .white,
         borderColor: Color? = nil,
         action: @escaping () -> Void
    ) {
        self.inverted = inverted
        self.backgroundColor = inverted ? foregroundColor : backgroundColor
        self.foregroundColor = inverted ? backgroundColor : foregroundColor
        self.borderColor = borderColor
        self.title = title
        self.action = action
        self.disabled = disabled
    }
    
    public var body: some View {
        HStack {
            Spacer(minLength: CustomButton.buttonHorizontalMargins)
            Button {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                self.action()
            }
            label: {
                Text(self.title)
                    .font(.headline)
                    .foregroundColor(foregroundColor)
                    .frame(maxWidth:.infinity)
            }
            .tint(.white)
            .buttonStyle(CustomButtonStyle(backgroundColor: backgroundColor, foregroundColor: foregroundColor, borderColor: border, isDisabled: disabled))
            .disabled(self.disabled)
            Spacer(minLength: CustomButton.buttonHorizontalMargins)
        }
        .frame(maxWidth:.infinity)
    }
}

struct CustomButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 1)
        )
    }
}
