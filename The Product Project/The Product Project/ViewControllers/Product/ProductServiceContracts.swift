//
//  ProductServiceContracts.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Moya
import Foundation

private enum Consts {
    static let productList: String = "developer-application-test/cart/list"
    static let productDetail: String = "developer-application-test/cart/%@/detail"
}

enum ProductServiceContracts: ServiceDefinable {
    case productList
    case productDetail(_ productId: String)
}

extension ProductServiceContracts {
    var path: String {
        switch self {
        case .productList:
            return Consts.productList
        case .productDetail(let productId):
            return String(format: Consts.productDetail, productId)
        }
    }
    
    var method: Method {
        switch self {
        case .productList, .productDetail:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .productList, .productDetail:
            return .requestParameters(parameters: [:], encoding: parameterEncoding)
        }
    }
}
