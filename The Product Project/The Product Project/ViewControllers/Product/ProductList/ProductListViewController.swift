//
//  ProductListViewController.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

class ProductListViewController: BaseViewController<ProductListPresenter> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.load()
    }
    
    private var products: [ProductListPresentation] = []
}

extension ProductListViewController: ProductListViewProtocol {
    func handleOutput(_ output: ProductListPresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            break
        case .setProducts(let products):
            self.products = products
        case .setErrorMessage(let message):
            break
        }
    }
}
