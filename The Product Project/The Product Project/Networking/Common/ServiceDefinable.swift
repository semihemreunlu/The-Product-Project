//
//  ServiceDefinable.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Moya
import Alamofire

typealias Method = Moya.Method
typealias Task = Moya.Task
typealias ParameterEncoding = Moya.ParameterEncoding
typealias JSONEncoding = Moya.JSONEncoding
typealias URLEncoding = Moya.URLEncoding
typealias PropertyListEncoding = Moya.PropertyListEncoding

protocol ServiceDefinable: TargetType {
   
}

extension ServiceDefinable {
    var baseURL: URL {
        return Enviroment.baseURL
    }
    
    var sampleData: Data {
        return Data()
    }

    var headers: [String : String]? {
        return RequestHeaders.defaultHeaders
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}
