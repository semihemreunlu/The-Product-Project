//
//  ResourceLoader.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

class ResourceLoader {
    static let decoder = JSONDecoder()
    static let bundle = Bundle.main
    
    public static func loadProductList(from jsonFile: String) throws -> ProductList? {
        let url = try bundle.url(forResource: jsonFile, withExtension: "json")
        let data = try Data(contentsOf: url!)
        let productList: ProductList? = try? decoder.decode(ProductList.self, from: data)
        return productList
    }
    
    public static func loadProductDetail(from jsonFile: String) throws -> ProductDetail? {
        let url = try bundle.url(forResource: jsonFile, withExtension: "json")
        let data = try Data(contentsOf: url!)
        let productDetail: ProductDetail? = try? decoder.decode(ProductDetail.self, from: data)
        return productDetail
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
