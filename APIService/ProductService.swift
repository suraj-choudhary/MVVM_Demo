//
//  ProductService.swift
//  DemoAppApi
//
//  Created by suraj kumar on 10/06/23.
//

import Foundation

protocol ProductServiceProtocol {
    func getProduct(completion: @escaping(_ sucess: Bool, _ _results: Welcome?, _ _error: String?) -> ())
}

class ProductService: ProductServiceProtocol {
    
    func getProduct(completion: @escaping (Bool, Welcome?, String?) -> ()) {
        RMservice.shared.execute(.products, expecting: Welcome.self) { result in
            switch result {
            case .success(let success):
               completion(true, success, nil)
            case .failure(let failure):
                completion(false, nil, failure.localizedDescription)
                
            }
        }
    }
}
