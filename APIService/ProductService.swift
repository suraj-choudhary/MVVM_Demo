//
//  ProductService.swift
//  DemoAppApi
//
//  Created by suraj kumar on 10/06/23.
//

import Foundation


/// Product Api Service Protocol
protocol ProductServiceProtocol {
    func getProduct(completion: @escaping(_ sucess: Bool, _ _results: allProductModel?, _ _error: String?) -> ())
}



/// Product service class
class ProductService: ProductServiceProtocol {
    
    func getProduct(completion: @escaping (Bool, allProductModel?, String?) -> ()) {
        RMservice.shared.execute(.products, expecting: allProductModel.self) { result in
            switch result {
            case .success(let success):
               completion(true, success, nil)
            case .failure(let failure):
                completion(false, nil, failure.localizedDescription)
                
            }
        }
    }
}
