//
//  ResultProductTVCell.swift
//  CollectionViewTesting
//
//  Created by Mac on 11.02.2023.
//

import UIKit

class ResultProductTVCell: UITableViewCell {
    
    var vm = ViewModel()
    
    var price: Float = 0
    var product = Product(name: "Test", price: 1, image: UIImage(named: "p1")!)
    
    var howMuch = 1

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
        self.productName.text = nil
        self.productPrice.text = nil
    }
    
    func setupCell(product: Product) {
        self.productImage.image = product.image
        self.productName.text = product.name + " x\(howMuch)"
        self.productPrice.text = String(product.price * Float(howMuch))
        self.price = product.price
        self.product = product
    }
    
    @IBAction func DeletePressed(_ sender: Any) {
        
        if ViewModel.resultProducts.contains(product) {
            vm.minusCost(by: price * Float(howMuch))
            vm.minusProduct(product: product)
            howMuch = 1
        }

        
        deleteButton.backgroundColor = .red
        deleteButton.tintColor = UIColor(named: "Background")
        deleteButton.layer.cornerRadius = 10
        deleteButton.isEnabled = false
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.deleteButton.backgroundColor = UIColor(named: "Background")
            self.deleteButton.tintColor = .red
            self.deleteButton.isEnabled = true
        }
        
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        howMuch += 1
        self.productName.text = product.name + " x\(howMuch)"
        self.productPrice.text = String(product.price * Float(howMuch))
        vm.plusCost(by: product.price)
        
        
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        if howMuch > 1 {
            howMuch -= 1
            self.productName.text = product.name + " x\(howMuch)"
            self.productPrice.text = String(product.price * Float(howMuch))
            vm.minusCost(by: product.price)
        }
        
    }
}
