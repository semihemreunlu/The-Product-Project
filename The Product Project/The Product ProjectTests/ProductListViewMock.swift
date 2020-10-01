//
//  ProductListViewMock.swift
//  The Product ProjectTests
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

import XCTest
@testable import The_Product_Project
 
class ProductListViewMock:  ProductListViewProtocol {
    var presenter: ProductListPresenter!
    
    var outputs: [ProductListPresenterOutput] = []

    func viewDidLoad() {
        presenter?.load()
    }

    func handleOutput(_ output: ProductListPresenterOutput) {
        outputs.append(output)
    }
}
