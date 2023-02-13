//
//  ViewModel.swift
//  CollectionViewTesting
//
//  Created by Mac on 10.02.2023.
//

import Foundation

class ViewModel {
    
    static var totalPrice: Float = 0
    
    func plusCost(by: Float){
        ViewModel.totalPrice += by
    }
    
    func minusCost(by: Float){
        ViewModel.totalPrice -= by
    }
    
    func zeroPrice() {
        ViewModel.totalPrice = 0
    }
    
    static var resultProducts: [Product] = []
    
    func plusProduct(product: Product) {
        ViewModel.resultProducts.append(product)
    }
    
    func minusProduct(product: Product) {
        if let index = ViewModel.resultProducts.firstIndex(of: product) {
            ViewModel.resultProducts.remove(at: index)
            
        }
    }
    
    func clearList() {
        ViewModel.resultProducts.removeAll()
    }
}
