//
//  ProductListPresentation.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

struct ProductListPresentation: Equatable {
    let name: String
    let price: Int
    let image: String
    
    public init(name: String,
                price: Int,
                image: String) {
        self.name = name
        self.price = price
        self.image = image
    }
}
