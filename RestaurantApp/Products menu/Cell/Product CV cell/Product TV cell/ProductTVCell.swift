//
//  ProductTVCell.swift
//  CollectionViewTesting
//
//  Created by Mac on 09.02.2023.
//

import UIKit

class ProductTVCell: UITableViewCell {
    
    var vm = ViewModel()
    
    var price: Float = 0
    var product = Product(name: "Test", price: 1, image: UIImage(named: "p1")!)

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var toBasketButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
        self.productName.text = nil
        self.productPrice.text = nil
    }
    
    func setupCell(product: Product) {
        self.productImage.image = product.image
        self.productName.text = product.name
        self.productPrice.text = String(product.price)
        self.price = product.price
        self.product = product
    }
    
    
    
    @IBAction func toBasketPressed(_ sender: Any) {
    
        vm.plusCost(by: price)
        vm.plusProduct(product: product)
        
        toBasketButton.backgroundColor = .orange
        toBasketButton.tintColor = UIColor(named: "Background")
        toBasketButton.layer.cornerRadius = 10
        toBasketButton.isEnabled = false
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.toBasketButton.backgroundColor = UIColor(named: "Background")
            self.toBasketButton.tintColor = .orange
            self.toBasketButton.isEnabled = true
        }
        
    }
    
    
}
