//
//  UIViewController+.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

extension UIViewController {
    private static func instanceFromNib<T: UIViewController>(name: String? = nil) -> T {
        return T(nibName: name ?? String(describing: self), bundle: nil)
    }

    static func instantiate(name: String? = nil) -> Self {
        return instanceFromNib(name: name)
    }
}
