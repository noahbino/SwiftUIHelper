//
//  RequestHelpers.swift
//  SwiftHelper
//
//  Created by Noah Iarrobino on 12/13/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

class RequestSender {
    static func sendRequest<T: Decodable>(request: URLRequest) async throws -> T {
        do {
            let (data, _): (Data, URLResponse) = try await URLSession.shared.data(for: request)
            
//            let stringResponse: String = String(decoding: data, as: UTF8.self)
//            print("RESPONSE HERE: \(stringResponse)")
            let decoder: JSONDecoder = .init()
            decoder.dateDecodingStrategy = .secondsSince1970
            let decoded: T = try decoder.decode(T.self, from: data)
            
            return decoded
        } catch {
            throw error
        }
    }
}

class RequestMaker {
    static func makeRequest<T: Encodable>(
        url: String,
        method: HTTPMethod,
        _ body: T? = nil as Data?
    ) -> URLRequest? {
        guard let url: URL = .init(string: url) else { return nil }
        var request: URLRequest = .init(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 15.0
                
        if let body: T = body {
            request.httpBody = try? JSONEncoder().encode(body)
        }
                
        return request
    }
}

