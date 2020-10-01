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
}

extension ProductListPresenter: ProductListInteractorDelegate {
    func handleOutput(_ output: ProductListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view?.handleOutput(.setLoading(isLoading))
        }
    }
}
