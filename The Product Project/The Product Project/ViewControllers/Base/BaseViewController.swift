//
//  BaseViewController.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

class BaseViewController<Presenter: BasePresenterProtocol>: UIViewController {
    var presenter: Presenter?
    
    private var statusBarShouldBeHidden = false
    
    override var prefersStatusBarHidden: Bool {
        return statusBarShouldBeHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
