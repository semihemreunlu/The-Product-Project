//
//  ProductService.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Moya

protocol ProductServiceProtocol {
    func getProductList(completion: @escaping (ProductList?, Error?) -> ())
    func getProductDetail(_ productId: String, completion: @escaping (ProductDetail?, Error?) -> ())
}

class ProductService: ProductServiceProtocol {
    var provider = MoyaProvider<ProductServiceContracts>(plugins: [NetworkLoggerPlugin(verbose: true)])
    let decoder = JSONDecoder()
    
    func getProductList(completion: @escaping (ProductList?, Error?) -> ()) {
        provider.request(.productList) { (response) in
            switch response.result {
            case .success(let value):
                do {
                    let products = try self.decoder.decode(ProductList.self, from: value.data)
                    completion(products, nil)
                } catch {
                    completion(nil,error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getProductDetail(_ productId: String, completion: @escaping (ProductDetail?, Error?) -> ()) {
        provider.request(.productDetail(productId)) { (response) in
            switch response.result {
            case .success(let value):
                do {
                    let products = try self.decoder.decode(ProductDetail.self, from: value.data)
                    completion(products, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

class ProductServiceMock: ProductServiceProtocol {
    var productList: ProductList?
    var productDetail: ProductDetail?
    
    func getProductList(completion: @escaping (ProductList?, Error?) -> ()) {
        completion(productList, nil)
    }
    
    func getProductDetail(_ productId: String, completion: @escaping (ProductDetail?, Error?) -> ()) {
        completion(productDetail, nil)
    }
}
