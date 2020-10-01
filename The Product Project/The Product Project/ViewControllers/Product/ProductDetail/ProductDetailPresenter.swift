//
//  ProductDetailPresenter.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

final class ProductDetailPresenter: BasePresenterProtocol, ProductDetailPresenterProtocol {
    internal weak var view: ProductDetailViewProtocol?
    internal var interactor: ProductDetailInteractorProtocol?
    internal var router: ProductDetailRouterProtocol?
    
    required init(interactor: ProductDetailInteractorProtocol,
         view: ProductDetailViewProtocol,
         router: ProductDetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor?.delegate = self
    }
    
    func load() {
        interactor?.load()
    }
    
    func closeButtonTapped() {
        router?.navigate(to: .productList)
    }
}

extension ProductDetailPresenter: ProductDetailInteractorDelegate {
    func handleOutput(_ output: ProductDetailInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view?.handleOutput(.setLoading(isLoading))
        case .setProduct(let product):
            let productPresentation = ProductDetailPresentation(name: product?.name ?? "",
                                                                  price: product?.price ?? 0,
                                                                  image: product?.image ?? "",
                                                                  descriptionText: product?.productDetailDescription ?? "")
            view?.handleOutput(.setProduct(productPresentation))
        case .setErrorMessage(let message):
            view?.handleOutput(.setErrorMessage(message))
        }
    }
}
