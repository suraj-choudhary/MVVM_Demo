//
//  ProductViewModel.swift
//  DemoAppApi
//
//  Created by suraj kumar on 10/06/23.
//

import Foundation

class ProductViewModel: NSObject {
    
    var reloadTableView: (() -> Void)?
    
    var products: Welcome = [] {
        didSet {
            reloadTableView?()
        }
    }
    
    
    var productService: ProductServiceProtocol
    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
    }
    
    func getProduct() {
        productService.getProduct { sucess, _results, _error in
            
            if sucess {
                self.products = _results!
            }
        }
    }
    
    
    
}


