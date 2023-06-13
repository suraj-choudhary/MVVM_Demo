//
//  RMRequest.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 26/04/23.
//
import Foundation
/// Oject that represt a single Api Call
final class RMRequest {
    private struct Constant {
        static let baseURL = "https://fakestoreapi.com"
    }
    private let endPoint: RMEndPoint
    private let pathComponent: [String]
    private let queryParameter: [URLQueryItem]
    
    /// Constructed url:
    private var urlString: String {
        var string = Constant.baseURL
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponent.isEmpty {
            string += "/"
            pathComponent.forEach({
                string += "\($0)"
            })
        }
        
        if !queryParameter.isEmpty {
            string += "?"
            let argumentString = queryParameter.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
        
    }
    public var url: URL? {
        return URL(string: urlString)
    }
    public var httpMethod: RMHttpMethod
    public var httpBody: Data?

    //MARK: public
    public init(endPoint: RMEndPoint,
                httpMethod: RMHttpMethod,
                body: Data? = Data(),
                pathComponent: [String] = [],
                queryParameter: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponent = pathComponent
        self.queryParameter = queryParameter
        self.httpMethod = httpMethod
        self.httpBody = body
    }
}
