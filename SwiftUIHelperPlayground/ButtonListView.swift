//
//  ButtonListView.swift
//  SwiftHelper
//
//  Created by Noah Iarrobino on 6/14/23.
//

import SwiftUI

struct ButtonListView: View {
    
    @State private var disabled: Bool = false
    
    @State private var invertedButton: Bool = true
    @State private var mintButton: Bool = true
    @State private var differentBorder: Bool = false
    
    var mintButtonTitle: String {
        (mintButton ? Color.mint.description : Color.orange.description) + " Button"
    }
    
    var invertedButtonTitle: String {
        (invertedButton ? "Inverted" : "Standard") + " Button"
    }
    
    var mintButtonColor: Color {
        mintButton ? .mint : .orange
    }
    
    public var body: some View {
        contentView
            .navigationTitle("Custom Button")
            .padding(.horizontal, 20)
    }

}

// MARK: Content View
extension ButtonListView {
    var contentView: some View {
        ScrollView {
            VStack(spacing: 20) {
                CustomButton(title: "Standard Button") { }
                CustomButton(title: "Disabled Button", disabled: disabled, action: { })
                CustomButton(title: "Disable Above Button", action: {
                    disabled.toggle()
                })
                CustomButton(title: invertedButtonTitle, inverted: invertedButton, action: {
                    invertedButton.toggle()
                })
                CustomButton(title: "Different Color Button", backgroundColor: .teal , foregroundColor: .black, action: { })
                CustomButton(title: mintButtonTitle, backgroundColor: mintButtonColor, action: {
                    mintButton.toggle()
                })
                CustomButton(title: "Different Border - \(differentBorder ? "On" : "Off")", inverted: true, borderColor: .green, action: {
                    differentBorder.toggle()
                })
            }
        }
    }
}
