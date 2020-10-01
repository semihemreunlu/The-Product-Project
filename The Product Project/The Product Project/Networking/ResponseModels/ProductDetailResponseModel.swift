//
//  ProductDetailResponseModel.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

// MARK: - ProductDetail
struct ProductDetail: Codable {
    let productId: String
    let name: String?
    let price: Int?
    let image: String?
    let productDetailDescription: String?

    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case name, price, image
        case productDetailDescription = "description"
    }
}
