//
//  ProductDetailViewController.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

class ProductDetailViewController: BaseViewController<ProductDetailPresenter> {

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.load()
    }
    
    var heroId: String!
}

extension ProductDetailViewController: ProductDetailViewProtocol {
    func handleOutput(_ output: ProductDetailPresenterOutput) {
        
    }
}
