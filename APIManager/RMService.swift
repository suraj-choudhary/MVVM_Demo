//
//  RMService.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 26/04/23.
//

import Foundation
/// Primary API Service object to get Rick and Morty
final class RMservice {
    /// Shared singlton  intstance
    static let shared = RMservice()
    private init() {}
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    /// Send Rick and Morty Api Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - completion: CallBack with data or error
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(.failure(RMServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    /// request
    /// - Parameter rmRequest: RMRequest class
    /// - Returns: URLRequest
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer", forHTTPHeaderField: "Authorization")
        switch rmRequest.httpMethod {
        case .get:
            request.httpMethod = RMHttpMethod.get.rawValue
        case .post:
            if let httpBodyData = rmRequest.httpBody {
                request.httpBody = httpBodyData
                request.httpMethod = RMHttpMethod.post.rawValue

            }
        case .put:
            request.httpMethod = RMHttpMethod.get.rawValue
        case .delete:
            request.httpMethod = RMHttpMethod.get.rawValue
        }
        return request
    }
}

extension RMRequest {
    static let products = RMRequest(endPoint: .products, httpMethod: .get)
}
