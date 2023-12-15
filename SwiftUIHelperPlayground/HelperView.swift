//
//  VMHelperView.swift
//  SwiftHelperPlayground
//
//  Created by Noah Iarrobino on 12/13/23.
//

import SwiftUI

struct HelperView: View {
    
    @StateObject private var viewModel: HelperViewModel = .init()
    
    var body: some View {
        ZStack {
            container
            
            bottomAlertContainer
        }
        .task {
            await viewModel.loadData()
        }
    }
    
    var bottomAlertContainer: some View {
        VStack {
            Spacer()
            if let bottomAlert: BottomAlert = viewModel.bottomAlertView {
                withAnimation {
                    bottomAlert
                        .transition(.move(edge: .bottom))
                }
            }
        }
    }
    
    var container: some View  {
        VStack {
            switch viewModel.status {
            case .loading, .ready:
                Spinner(isAnimating: .constant(true))
            case .loaded(let users):
                loadedView(users: users)
            case .error(let error):
                Text("Error: \(error)")
                Button("Try again") {
                    Task {
                        await viewModel.loadData()
                    }
                }
            }
            Spacer()
        }
    }
    
    func loadedView(users: [UserOBJ]) -> some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(users) { user in
                        Text(user.title)
                    }
                }
            }
            .padding(.horizontal, 10)
            
            CustomButton(title: "Make error") {
                self.viewModel.status = .error("")
                self.viewModel.buildBottomAlert(type: .successCustom("You made an error!"))
            }
            .padding(10)
        }
    }
}
