//
//  ColorView.swift
//  SwiftHelper
//
//  Created by Noah Iarrobino on 6/14/23.
//

import SwiftUI

struct ColorView: View {
    
    @State var color: Color = .randomColor()
    
    var body: some View {
        VStack {
            Text(color.description)
                .maxWidth()
                .padding(.vertical)
                .border(color, width: 1, cornerRadius: 8)
            CustomButton(title: "Random Color Generator", backgroundColor: color) {
                color = .randomColor()
            }
        }
        .navigationTitle("Color")
        .padding(.horizontal, 20)
    }
}

