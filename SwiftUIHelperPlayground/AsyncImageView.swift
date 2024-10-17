//
//  AsyncImageView.swift
//  SwiftUIHelperPlayground
//
//  Created by Noah Iarrobino on 10/17/24.
//

import SwiftUI

struct AsyncImageViewExample: View {
    
    var defaultURL: String = "https://images.aeonmedia.co/images/4feda9d0-bdb6-464f-88e3-b70ae02578fe/essay-wood-cats-149626371.jpg?width=1200&quality=75&format=auto"
    
    @State var input: String = ""
    @State var url: URL?
    
    var body: some View {
        VStack {
            TextField("Paste URL Here", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            CustomButton(title: "Load Image") {
                if let url: URL = .init(string: input) {
                    self.url = url
                }
            }
            
            Spacer()
            
            if let url: URL = self.url {
                AsyncImageView(url: url, aspectRatio: .fit)
                    .id(url)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            if let url: URL = .init(string: defaultURL) {
                self.url = url
            }
        }
    }
}

