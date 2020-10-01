//
//  ProductDetailPresentation.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

struct ProductDetailPresentation: Equatable {
    let name: String
    let price: Int
    let image: String
    let descriptionText: String
    
    public init(name: String,
                price: Int,
                image: String,
                descriptionText: String) {
        self.name = name
        self.price = price
        self.image = image
        self.descriptionText = descriptionText
    }
}
