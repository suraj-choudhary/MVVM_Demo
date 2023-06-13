//
//  ProductTableCellViewModel.swift
//  DemoAppApi
//
//  Created by suraj kumar on 14/06/23.
//

import Foundation

struct ProductTableCellViewModel {
    var productImage: String
    var productName: String
    
    init(productImage: String, productName: String) {
        self.productImage = productImage
        self.productName = productName
    }
}
