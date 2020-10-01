//
//  ProductListRouterMock.swift
//  The Product ProjectTests
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

import XCTest
@testable import The_Product_Project

class ProductListRouterMock: ProductListRouterProtocol {
    
    var routes: [ProductListRoute] = []
    
    func navigate(to route: ProductListRoute) {
        routes.append(route)
    }
}

