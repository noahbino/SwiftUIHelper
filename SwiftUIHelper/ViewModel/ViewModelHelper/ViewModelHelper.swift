//
//  ViewModelHelper.swift
//  SwiftHelper
//
//  Created by Noah Iarrobino on 12/13/23.
//

import Foundation

public class ViewModelConstants {
    static var presentationLength: Double = 2.0
}

public class ViewModel: NSObject, ObservableObject {
    
    // MARK: - Status
    enum Status {
        case ready
        case loading
        case loaded
        case error(String)
    }
    
    // MARK: - Published Variables
    @Published var status: Status = .ready
    
    // MARK: - Bottom Alert
    @Published var bottomAlertView: BottomAlert?
}

// MARK: - Build Bottom Alert
public extension ViewModel {
    func buildBottomAlert(type: BottomAlertType) {
        DispatchQueue.main.async {
            self.bottomAlertView = BottomAlert(type: type)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + ViewModelConstants.presentationLength) {
                self.bottomAlertView = nil
            }
        }
    }
}
