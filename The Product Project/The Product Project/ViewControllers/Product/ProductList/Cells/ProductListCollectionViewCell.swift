//
//  ProductListCollectionViewCell.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit
import SDWebImage
import Hero

class ProductListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var barView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setElement(_ product: ProductListPresentation?) {
        titleLabel.text = product?.name ?? ""
        priceLabel.text = String(format: "%d ₺", product?.price ?? 0)
        
        guard let imageUrl = URL(string: product?.image ?? "") else {
            return
        }
        imageView.sd_setImage(with: imageUrl,
                              placeholderImage: UIImage(named: "placeholder"))
        imageView.hero.id = product?.productId ?? ""
        barView.hero.id = "bar\(product?.productId ?? "")"
    }
}
