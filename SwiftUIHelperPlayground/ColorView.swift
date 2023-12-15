//
//  ColorView.swift
//  SwiftHelper
//
//  Created by Noah Iarrobino on 6/14/23.
//

import SwiftUI

struct ColorView: View {
    
    @State var color: Color
    
    var body: some View {
        VStack {
            Text(color.description)
                .padding(.vertical)
            CustomButton(title: "Random Color Generator", backgroundColor: color) {
                color = .randomColor()
            }
        }
        .navigationTitle("Color")
        .padding(.horizontal, 20)
    }
}

