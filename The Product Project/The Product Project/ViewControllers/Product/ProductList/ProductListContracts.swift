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
}

enum ProductListInteractorOutput {
    case setLoading(_ isLoading: Bool)
}

protocol ProductListInteractorDelegate: AnyObject {
    func handleOutput(_ output: ProductListInteractorOutput)
}

// MARK: - Presenter
protocol ProductListPresenterProtocol: AnyObject {
    func load()
}

enum ProductListPresenterOutput: Equatable {
    case setLoading(_ isLoading: Bool)
    
    static func == (lhs: ProductListPresenterOutput, rhs: ProductListPresenterOutput) -> Bool {
        return true
    }
}

// MARK: - Router
enum ProductListRoute: Equatable {
}

protocol ProductListRouterProtocol: AnyObject {
    func navigate(to route: ProductListRoute)
}
