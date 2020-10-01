//
//  ProductListViewController.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

class ProductListViewController: BaseViewController<ProductListPresenter> {
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.load()
    }
}

extension ProductListViewController: ProductListViewProtocol {
    func handleOutput(_ output: ProductListPresenterOutput) {
        
    }
}
