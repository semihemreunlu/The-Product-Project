//
//  ProductDetailBuilder.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

final class ProductDetailBuilder: NSObject {
    static func make(with productId: String) -> UIViewController {
        let viewController = ProductDetailViewController.instantiate()
        let router = ProductDetailRouter(view: viewController)
        let service = ProductService()
        let interactor = ProductDetailInteractor(service: service, productId: productId)
        let presenter = ProductDetailPresenter(interactor: interactor,
                                             view: viewController,
                                             router: router)
        viewController.presenter = presenter
        viewController.hero.isEnabled = true
        viewController.heroId = productId
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
