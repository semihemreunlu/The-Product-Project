//
//  BasePresenterProtocol.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

protocol BasePresenterProtocol: class {
    associatedtype InteractorProtocol
    associatedtype ViewProtocol
    associatedtype RouterProtocol

    var interactor: InteractorProtocol? { get set }
    var view: ViewProtocol? { get set }
    var router: RouterProtocol? { get set }
    
    init(interactor: InteractorProtocol, view: ViewProtocol, router: RouterProtocol)
}
