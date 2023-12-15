//
//  Color.swift
//  SwiftHelper
//
//  Created by Noah Iarrobino on 12/14/23.
//

import SwiftUI

extension Color {
    
    /// Random Color Generator
    /// - Returns: This Function Returns a Completely Random Color
    static func randomColor() -> Color {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let alpha = CGFloat.random(in: 0.7...1)
        
        let uiColor: UIColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return Color(uiColor: uiColor)
    }
}
