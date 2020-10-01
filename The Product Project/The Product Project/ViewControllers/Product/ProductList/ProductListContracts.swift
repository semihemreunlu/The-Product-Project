//
//  ProductListContracts.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

// MARK: - View
protocol ProductListViewProtocol: AnyObject {
    func handleOutput(_ output: ProductListPresenterOutput)
}

// MARK: - Interactor
protocol ProductListInteractorProtocol: AnyObject {
    var delegate: ProductListInteractorDelegate? { get set }
    
    func load()
    func productSelected(at index: Int)
}

enum ProductListInteractorOutput {
    case setLoading(_ isLoading: Bool)
    case setProductList(_ productList: ProductList?)
    case setErrorMessage(_ message: String)
    case productSelected(_ productId: String)
}

protocol ProductListInteractorDelegate: AnyObject {
    func handleOutput(_ output: ProductListInteractorOutput)
}

// MARK: - Presenter
protocol ProductListPresenterProtocol: AnyObject {
    func load()
    func productSelected(at index: Int)
}

enum ProductListPresenterOutput: Equatable {
    case setLoading(_ isLoading: Bool)
    case setProducts(_ products: [ProductListPresentation])
    case setErrorMessage(_ message: String)
    
    static func == (lhs: ProductListPresenterOutput, rhs: ProductListPresenterOutput) -> Bool {
        return true
    }
}

// MARK: - Router
enum ProductListRoute: Equatable {
    case productDetail(_ productId: String)
}

protocol ProductListRouterProtocol: AnyObject {
    func navigate(to route: ProductListRoute)
}
