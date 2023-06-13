//
//  RMEndPoint.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 26/04/23.
//

import Foundation
/// Represent uinique api call
@frozen enum RMEndPoint: String {
    case products
    var path: String {
        switch self {
        case .products:
            return "products"
        }
    }
}
