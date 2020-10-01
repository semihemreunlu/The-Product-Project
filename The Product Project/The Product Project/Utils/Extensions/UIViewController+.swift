//
//  UIViewController+.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit
import ProgressHUD

extension UIViewController {
    private static func instanceFromNib<T: UIViewController>(name: String? = nil) -> T {
        return T(nibName: name ?? String(describing: self), bundle: nil)
    }

    static func instantiate(name: String? = nil) -> Self {
        return instanceFromNib(name: name)
    }
    
    func showHud() {
        ProgressHUD.animationType = .circleSpinFade
        ProgressHUD.colorAnimation = .orange
        ProgressHUD.show()
    }
    
    func hideHud(_ delay: Double? = nil) {
        self.delayOperation(delay ?? 0) {
            ProgressHUD.dismiss()
        }
    }
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ok".localize, style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
