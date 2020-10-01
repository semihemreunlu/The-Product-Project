//
//  ProductListBuilder.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

final class ProductListBuilder: NSObject {
    static func make() -> UIViewController {
        let viewController = ProductListViewController.instantiate()
        let router = ProductListRouter(view: viewController)
        let service = ProductService()
        let interactor = ProductListInteractor(service: service)
        let presenter = ProductListPresenter(interactor: interactor,
                                             view: viewController,
                                             router: router)
        viewController.presenter = presenter
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
