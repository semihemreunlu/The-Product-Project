//
//  ProductListRouter.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

class ProductListRouter: ProductListRouterProtocol {
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: ProductListRoute) {
        
    }
}
