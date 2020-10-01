//
//  Enviroment.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

var isDebug: Bool {
    #if DEBUG
    return true
    #else
    return false
    #endif
}

struct Enviroment {
    static let baseURL = URL(string: "https://s3-eu-west-1.amazonaws.com")!
}
