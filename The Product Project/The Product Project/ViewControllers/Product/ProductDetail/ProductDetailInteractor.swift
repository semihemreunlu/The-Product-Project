//
//  ProductDetailInteractor.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

final class ProductDetailInteractor: ProductDetailInteractorProtocol {
    weak var delegate: ProductDetailInteractorDelegate?
    private let service: ProductServiceProtocol
    private var productId: String!
    
    init(service: ProductServiceProtocol, productId: String) {
        self.service = service
        self.productId = productId
    }
    
    func load() {
        self.delegate?.handleOutput(.setLoading(true))
        
        self.service.getProductDetail(self.productId) { (product, error) in
            self.delegate?.handleOutput(.setLoading(false))
            
            if error != nil {
                self.delegate?.handleOutput(.setErrorMessage("Unknown Error"))
            } else {
                self.delegate?.handleOutput(.setProduct(product))
            }
        }
    }
}

