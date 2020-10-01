//
//  ProductDetailViewController.swift
//  The Product Project
//
//  Created by Semih Emre Ünlü on 1.10.2020.
//

import UIKit

class ProductDetailViewController: BaseViewController<ProductDetailPresenter> {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var barView: UIView!
    
    var heroId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setHeroTransitions()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        presenter?.closeButtonTapped()
    }
    
    func setHeroTransitions() {
        imageView.hero.id = heroId
        imageView.hero.modifiers = [.forceNonFade]
        
        barView.hero.id = "bar\(heroId!)"
        barView.hero.modifiers = [.forceNonFade]
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol {
    func handleOutput(_ output: ProductDetailPresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? self.showHud() : self.hideHud(0.5)
        case .setProduct(let product):
            self.nameLabel.text = product.name
            self.title = product.name
            self.descriptionLabel.text = product.descriptionText
            self.priceLabel.text = String(format: "%d ₺", product.price)
            guard let imageUrl = URL(string: product.image) else {
                return
            }
            self.imageView.sd_setImage(with: imageUrl,
                                       placeholderImage: UIImage(named: "placeholder"))
        case .setErrorMessage(let message):
            self.showAlert(message)
        }
    }
}
