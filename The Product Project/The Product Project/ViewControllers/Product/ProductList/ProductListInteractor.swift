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
    }
}
