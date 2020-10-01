//
//  ProductListInteractor.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

final class ProductListInteractor: ProductListInteractorProtocol {
    weak var delegate: ProductListInteractorDelegate?
    private let service: ProductServiceProtocol
    private var productList: ProductList?
    
    init(service: ProductServiceProtocol) {
        self.service = service
    }
    
    func load() {
        self.delegate?.handleOutput(.setLoading(true))
        
        self.service.getProductList(completion: { (productList, error) in
            self.delegate?.handleOutput(.setLoading(false))
            
            if error != nil {
                self.delegate?.handleOutput(.setErrorMessage("Unknown Error"))
            } else {
                self.productList = productList
                self.delegate?.handleOutput(.setProductList(productList))
            }
        })
    }
    
    func productSelected(at index: Int) {
        guard let productId = productList?.products[safe: index]?.productId else {
            return
        }
        self.delegate?.handleOutput(.productSelected(productId))
    }
}
