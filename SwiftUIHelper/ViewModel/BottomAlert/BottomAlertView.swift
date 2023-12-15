//
//  BottomAlertView.swift
//  SwiftHelper
//
//  Created by Noah Iarrobino on 12/13/23.
//

import SwiftUI

struct BottomAlert: View {
    var type: BottomAlertType
    
    var message: String {
        type.info.0
    }
    
    var image: String {
        type.info.1
    }
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing, 8)
                .padding(.leading, 20)
            Text(message)
                .font(.footnote)
            Spacer()
        }
        .frame(height: 60)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .background(
            Rectangle()
                .fill(BottomAlertConstants.alertColor)
                .cornerRadius(8)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 8,
                    x: 0,
                    y: 0
                )
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
        )
        .backgroundStyle(BottomAlertConstants.alertColor)
    }
}

enum BottomAlertType {
    case success
    case failure
    case failCustom(String)
    case successCustom(String)

    var info: (String, String) {
        switch self {
        case .success:
            return (BottomAlertConstants.successMessage, BottomAlertConstants.successImage)
        case .failure:
            return (BottomAlertConstants.failureMessage, BottomAlertConstants.failureImage)
        case .failCustom(let msg):
            return (msg, BottomAlertConstants.failureImage)
        case .successCustom(let msg):
            return (msg, BottomAlertConstants.successImage)
        }
    }
}

class BottomAlertConstants {
    static var successMessage: String = "Success"
    static var failureMessage: String = "Failure"
    
    static var successImage: String = "checkmark"
    static var failureImage: String = "xmark"
    
    static var alertColor: Color = Color.init(uiColor: .systemBackground)
}


