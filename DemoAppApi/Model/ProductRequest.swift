//
//  ProductRequest.swift
//  DemoAppApi
//
//  Created by suraj kumar on 10/06/23.
//

import Foundation
struct ProductRequest: Codable {
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: String
}
