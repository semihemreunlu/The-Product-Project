//
//  ProductDetailContracts.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

// MARK: - View
protocol ProductDetailViewProtocol: AnyObject {
    func handleOutput(_ output: ProductDetailPresenterOutput)
}

// MARK: - Interactor
protocol ProductDetailInteractorProtocol: AnyObject {
    var delegate: ProductDetailInteractorDelegate? { get set }
    
    func load()
}

enum ProductDetailInteractorOutput {
    case setLoading(_ isLoading: Bool)
    case setProduct(_ product: ProductDetail?)
    case setErrorMessage(_ message: String)
}

protocol ProductDetailInteractorDelegate: AnyObject {
    func handleOutput(_ output: ProductDetailInteractorOutput)
}

// MARK: - Presenter
protocol ProductDetailPresenterProtocol: AnyObject {
    func load()
}

enum ProductDetailPresenterOutput: Equatable {
    case setLoading(_ isLoading: Bool)
    case setProduct(_ product: ProductDetailPresentation)
    case setErrorMessage(_ message: String)
    
    static func == (lhs: ProductDetailPresenterOutput, rhs: ProductDetailPresenterOutput) -> Bool {
        return true
    }
}

// MARK: - Router
enum ProductDetailRoute: Equatable {
    case productList
}

protocol ProductDetailRouterProtocol: AnyObject {
    func navigate(to route: ProductDetailRoute)
}
