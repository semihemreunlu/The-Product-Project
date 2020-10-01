//
//  ProductDetailRouter.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

class ProductDetailRouter: ProductDetailRouterProtocol {
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: ProductDetailRoute) {
        switch route {
        case .productList:
            self.view.dismiss(animated: true, completion: nil)
        }
    }
}
