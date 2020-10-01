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
        switch route {
        case .productDetail(let productId):
            let viewController = ProductDetailBuilder.make(with: productId)
            self.view.present(viewController, animated: true)
        break
        }
    }
}
