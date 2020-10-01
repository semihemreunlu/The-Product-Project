//
//  ProductListResponseModel.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

// MARK: - ProductList
struct ProductList: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let productId, name: String
    let price: Int
    let image: String

    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case name, price, image
    }
}
