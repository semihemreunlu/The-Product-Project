//
//  The_Product_ProjectTests.swift
//  The Product ProjectTests
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import XCTest
@testable import The_Product_Project

private var view: ProductListViewMock!
private var interactor: ProductListInteractor!
private var presenter: ProductListPresenter!
private var router: ProductListRouterMock!
private var service: ProductServiceMock!

class The_Product_ProjectTests: XCTestCase {

        override class func setUp() {
            super.setUp()
        
            service = ProductServiceMock()
            view = ProductListViewMock()
            interactor = ProductListInteractor(service: service)
            router = ProductListRouterMock()
            presenter = ProductListPresenter(interactor: interactor,
                                             view: view,
                                             router: router)
            view.presenter = presenter
        }
    
    func testLoadProductList(){
        // Given:
        let productList = try? ResourceLoader.loadProductList(from: "products")
        service.productList = productList
        
        // When:
        view.viewDidLoad()
        
        // Then:
        XCTAssertEqual(view.outputs.count, 3)
        
        XCTAssertEqual(view.outputs[0], .setLoading(true))
        XCTAssertEqual(view.outputs[1], .setLoading(false))
        XCTAssertEqual(view.outputs[2], .setProducts([]))
    }
}


