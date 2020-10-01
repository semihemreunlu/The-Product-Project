//
//  ProductListViewController.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit
import ProgressHUD

class ProductListViewController: BaseViewController<ProductListPresenter> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.load()
        
        setNavigationBar()
        setCollectionView()
    }
    
    private var products: [ProductListPresentation] = []
    
    enum CellLayoutType {
        case Single
        case Multiple
    }
    
    private var cellLayoutType = CellLayoutType.Single
    
    private let singleCellHeight: CGFloat = 100
    private let multipleCellWidth: CGFloat = Constants.screenWidth / 2 - 4
    private let multipleCellHeight: CGFloat = Constants.screenWidth / 1.2
    
    func setNavigationBar() {
        let barButton = UIButton(type: .custom)
        barButton.addTarget(self, action: #selector(changeLayout), for: .touchUpInside)
        barButton.setImage(UIImage(named: "change"), for: UIControl.State())
        
        let barButtonItem = UIBarButtonItem(customView: barButton)
        self.navigationItem.leftBarButtonItem = barButtonItem
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationController?.navigationBar.tintColor = .black
        
        self.title = "Products"
    }
    
    func setCollectionView() {
        collectionView.register(UINib(nibName: "ProductListSingleCollectionViewCell",
                                      bundle: nil),
                                forCellWithReuseIdentifier: "ProductListSingleCollectionViewCell")
        
        collectionView.register(UINib(nibName: "ProductListMultipleCollectionViewCell",
                                      bundle: nil),
                                forCellWithReuseIdentifier: "ProductListMultipleCollectionViewCell")
    }
    
    @objc func changeLayout() {
        cellLayoutType = cellLayoutType == CellLayoutType.Single ? .Multiple : .Single
        collectionView.reloadData()
    }
}

extension ProductListViewController: ProductListViewProtocol {
    func handleOutput(_ output: ProductListPresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? self.showHud() : self.hideHud(0.5)
        case .setProducts(let products):
            self.products = products
            self.collectionView.reloadData()
        case .setErrorMessage(let message):
            self.showAlert(message)
        }
    }
}

extension ProductListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: ProductListCollectionViewCell!
        switch cellLayoutType {
        case .Single:
            cell = collectionView.dequeueReusableCell(for: indexPath,
                                                          cellType: ProductListSingleCollectionViewCell.self)
        case .Multiple:
            cell = collectionView.dequeueReusableCell(for: indexPath,
                                                          cellType: ProductListMultipleCollectionViewCell.self)
        }
        let product = products[safe: indexPath.row]
        cell.setElement(product)
        return cell
    }
    
}

extension ProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.productSelected(at: indexPath.row)
    }
}

extension ProductListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch cellLayoutType {
        case .Single:
            return CGSize(width: Constants.screenWidth, height: self.singleCellHeight)
        case .Multiple:
            return CGSize(width: self.multipleCellWidth, height: self.multipleCellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
}

