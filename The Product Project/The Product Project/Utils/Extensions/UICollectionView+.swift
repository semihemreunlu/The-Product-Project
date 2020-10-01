//
//  UICollectionView+.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

// MARK: Reusable support for UICollectionView
extension UICollectionViewCell: Reusable {
}

extension UICollectionReusableView: Reusable {
}

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self, reuseIdentifier: String? = nil) -> T {
        let cell = self.dequeueReusableCell(withReuseIdentifier: reuseIdentifier ?? cellType.reuseIdentifier, for: indexPath) as! T
        return cell
    }
}
