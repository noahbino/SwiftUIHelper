//
//  ViewModelHelper.swift
//  SwiftHelper
//
//  Created by Noah Iarrobino on 12/13/23.
//

import Foundation

class ViewModelConstants {
    static var presentationLength: Double = 2.0
}

class ViewModel<T>: NSObject, ObservableObject {
    
    // MARK: - Status
    enum Status {
        case ready
        case loading
        case loaded(T)
        case error(String)
    }
    
    // MARK: - Stored Object
    @Published var object: T? = nil
    
    // MARK: - Published Variables
    @Published var status: Status = .ready {
        didSet {
            switch status {
            case .loaded(let object):
                self.object = object
            default:
                break
            }
        }
    }
    
    // MARK: - Bottom Alert
    @Published var bottomAlertView: BottomAlert?
    
    @Published var alwaysAnimating: Bool = true
}

// MARK: - Build Bottom Alert
extension ViewModel {
    func buildBottomAlert(type: BottomAlertType) {
        DispatchQueue.main.async {
            
            self.bottomAlertView = BottomAlert(type: type)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + ViewModelConstants.presentationLength) {
                self.bottomAlertView = nil
            }
        }
    }
}
