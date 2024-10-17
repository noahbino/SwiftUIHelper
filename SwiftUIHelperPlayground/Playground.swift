//
//  Playground.swift
//  SwiftUIHelperPlayground
//
//  Created by Noah Iarrobino on 4/14/24.
//

import SwiftUI

enum Features: CaseIterable {
    
    case randomColor
    case buttonList
    case viewModel
    case imageView
    
    var name: String {
        switch self {
        case .randomColor:
            return "Random Color"
        case .buttonList:
            return "Buttons"
        case .viewModel:
            return "View Model"
        case .imageView:
            return "Async Image View"
        }
    }
    
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .randomColor:
            ColorView()
        case .buttonList:
            ButtonListView()
        case .viewModel:
            HelperView()
        case .imageView:
            AsyncImageViewExample()
        }
    }
}

struct Playground: View {
    
    var body: some View {
        NavigationStack {
            viewController
        }
    }
    
    var viewController: some View {
        List {
            ForEach(Features.allCases, id: \.self) { feature in
                NavigationLink {
                    feature.view
                } label: {
                    Text(feature.name)
                }            }
        }
    }
}
