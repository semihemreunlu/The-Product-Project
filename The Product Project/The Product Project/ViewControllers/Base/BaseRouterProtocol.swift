//
//  BaseRouterProtocol.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import Foundation

protocol BaseRouterProtocol {
    associatedtype View
    
    var view: View? { get set }
    
    init(view: View)
}
