//
//  ProductViewModel.swift
//  DemoAppApi
//
//  Created by suraj kumar on 10/06/23.
//

import Foundation
/// Produc view Model
class ProductViewModel: NSObject {
    
    var reloadTableView: (() -> Void)?
    var productModel = allProductModel()
    
    var productTableCellViewModel = [ProductTableCellViewModel]() {
        
        didSet {
            reloadTableView?()
        }
    }
    
    var productService: ProductServiceProtocol
    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
    }
    
    func fetchProduct() {
        productService.getProduct { sucess, _results, _error in
            self.getProduct(model: _results ?? nil)
        }
    }
    
    
    func getProduct(model: allProductModel?) {
        self.productModel = model!
        
        var cellViewModel = [ProductTableCellViewModel]()
        
        for cell in productModel {
            cellViewModel.append(createCellModel(model: cell))
        }
        self.productTableCellViewModel = cellViewModel
    }
    
    func createCellModel(model: ProductModel) -> ProductTableCellViewModel {
        let name = model.image
        let productName = model.title
        return ProductTableCellViewModel(productImage: name, productName: productName)
    }
    
    func getCellViewModel(at index: IndexPath) -> ProductTableCellViewModel {
        
        return productTableCellViewModel[index.row]
    }
    
}
