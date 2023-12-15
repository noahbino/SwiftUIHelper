//
//  ViewModel.swift
//  SwiftHelperPlayground
//
//  Created by Noah Iarrobino on 12/13/23.
//

import Foundation


class HelperViewModel: ViewModel<[UserOBJ]> {
    
    let urlString: String = "https://jsonplaceholder.typicode.com/posts"
    
    @MainActor
    func loadData() async {
        self.status = .loading
        
        guard let request: URLRequest = RequestMaker.makeRequest(url: urlString, method: .get) else {
            self.status = .error("Couldn't make request")
            self.buildBottomAlert(type: .failure)
            return
        }
        
        do {
            let users: [UserOBJ] = try await RequestSender.sendRequest(request: request)
            self.status = .loaded(users)
        } catch {
            print("ERROR: \(error)")
            self.status = .error(error.localizedDescription)
        }
    }
}

struct UserOBJ: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
