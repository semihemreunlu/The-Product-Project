//
//  ProductListPresenter.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

final class ProductListPresenter: BasePresenterProtocol, ProductListPresenterProtocol {
    internal weak var view: ProductListViewProtocol?
    internal var interactor: ProductListInteractorProtocol?
    internal var router: ProductListRouterProtocol?
    
    required init(interactor: ProductListInteractorProtocol,
         view: ProductListViewProtocol,
         router: ProductListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor?.delegate = self
    }
    
    func load() {
        interactor?.load()
    }
    
    func productSelected(at index: Int) {
        interactor?.productSelected(at: index)
    }
}

extension ProductListPresenter: ProductListInteractorDelegate {
    func handleOutput(_ output: ProductListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view?.handleOutput(.setLoading(isLoading))
        case .setProductList(let productList):
            var products: [ProductListPresentation] = []
            
            for product in productList?.products ?? [] {
                let productPresentation = ProductListPresentation(name: product.name,
                                                                  price: product.price,
                                                                  image: product.image)
                products.append(productPresentation)
            }
            
            view?.handleOutput(.setProducts(products))
        case .setErrorMessage(let message):
            view?.handleOutput(.setErrorMessage(message))
        case .productSelected(let productId):
            router?.navigate(to: .productDetail(productId))
        }
    }
}
