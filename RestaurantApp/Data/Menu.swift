//
//  Menu.swift
//  CollectionViewTesting
//
//  Created by Mac on 06.02.2023.
//

import Foundation
import UIKit

struct Group {
    var groups: [Group]?
    var name: String
    var products: [Product]?
    var image: UIImage
}

struct Product: Equatable {
    var name: String
    var price: Float
    var image: UIImage
}

class Menu {
    
    var groups = [Group]()
    
    init(){
        setup()
    }
    
    func setup(){
        
        // PIZZA
        let p1 = Product(name: "Havai (20sm)", price: 40, image: UIImage(named: "p1")!)
        let p2 = Product(name: "Havai (30sm)", price: 100, image: UIImage(named: "p1")!)
        let p3 = Product(name: "Havai (40sm)", price: 140, image: UIImage(named: "p1")!)
        let p4 = Product(name: "Havai (45sm)", price: 160, image: UIImage(named: "p1")!)
        let p5 = Product(name: "Havai (titanium)", price: 200, image: UIImage(named: "p1")!)
        let p6 = Product(name: "Havai (PAPASIZE)", price: 240, image: UIImage(named: "p1")!)
        let p7 = Product(name: "Havai (KINGDOM)", price: 340, image: UIImage(named: "p1")!)
        
        let p8 = Product(name: "Carbonara (20sm)", price: 45, image: UIImage(named: "p1")!)
        let p9 = Product(name: "Carbonara (30sm)", price: 110, image: UIImage(named: "p1")!)
        let p10 = Product(name: "Carbonara (45sm)", price: 175, image: UIImage(named: "p1")!)
        
        let p11 = Product(name: "Caesar (20sm)", price: 47, image: UIImage(named: "p1")!)
        let p12 = Product(name: "Caesar (30sm)", price: 115, image: UIImage(named: "p1")!)
        let p13 = Product(name: "Caesar (45sm)", price: 180, image: UIImage(named: "p1")!)
        
        let pizzaGroup1 = Group(groups: nil, name: "Havai", products: [p1,p2,p3,p4,p5,p6,p7], image: UIImage(named: "p1")!)
        let pizzaGroup2 = Group(groups: nil, name: "Carbonara", products: [p8,p9,p10], image: UIImage(named: "p1")!)
        let pizzaGroup3 = Group(groups: nil, name: "Caesar", products: [p11,p12,p13], image: UIImage(named: "p1")!)
        
        let pizzaGroup = Group(groups: [pizzaGroup1,pizzaGroup2,pizzaGroup3], name: "Pizza", products: nil, image: UIImage(named: "p1")!)
        
        //BURGERS
        let b1 = Product(name: "chicken cheese (children)", price: 180, image: UIImage(named: "p2")!)
        let b2 = Product(name: "chicken cheese (standard) ", price: 200, image: UIImage(named: "p2")!)
        let b3 = Product(name: "chicken cheese (titanium)", price: 270, image: UIImage(named: "p2")!)
        let b4 = Product(name: "chicken cheese (PAPASIZE)", price: 340, image: UIImage(named: "p2")!)
        
        let b5 = Product(name: "heavy beef (children)", price: 200, image: UIImage(named: "p3")!)
        let b6 = Product(name: "heavy beef (standard)", price: 225, image: UIImage(named: "p3")!)
        let b7 = Product(name: "heavy beef (titanium)", price: 290, image: UIImage(named: "p3")!)
        let b8 = Product(name: "heavy beef (PAPASIZE)", price: 370, image: UIImage(named: "p3")!)
        
        let b9 = Product(name: "happy piggy (children)", price: 190, image: UIImage(named: "p4")!)
        let b10 = Product(name: "happy piggy (standard)", price: 210, image: UIImage(named: "p4")!)
        let b11 = Product(name: "happy piggy (titanium)", price: 280, image: UIImage(named: "p4")!)
        let b12 = Product(name: "happy piggy (PAPASIZE)", price: 365, image: UIImage(named: "p4")!)
        
        
        let burgerGroup1 = Group(groups: nil, name: "chicken cheese", products: [b1,b2,b3,b4], image: UIImage(named: "p2")!)
        let burgerGroup2 = Group(groups: nil, name: "heavy beef", products: [b5,b6,b7,b8], image: UIImage(named: "p3")!)
        let burgerGroup3 = Group(groups: nil, name: "happy piggy", products: [b9,b10,b11,b12], image: UIImage(named: "p2")!)
        
        let burgerGroup = Group(groups: [burgerGroup1,burgerGroup2,burgerGroup3], name: "Burgers", products: nil, image: UIImage(named: "p2")!)
        
        //SUSHI
        let s1 = Product(name: "Osama (standard)", price: 400, image: UIImage(named: "p5")!)
        let s2 = Product(name: "Osama (family)", price: 550, image: UIImage(named: "p5")!)
        let s3 = Product(name: "Itakka (standard)", price: 470, image: UIImage(named: "p5")!)
        
        let sushiGroup1 = Group(groups: nil, name: "Osama", products: [s1,s2], image: UIImage(named: "p5")!)
        let sushiGroup2 = Group(groups: nil, name: "Itakka", products: [s3], image: UIImage(named: "p5")!)
        let sushiGroup3 = Group(groups: nil, name: "Philadelphia", products: [], image: UIImage(named: "p5")!)
        
        let sushiGroup = Group(groups: [sushiGroup1,sushiGroup2,sushiGroup3], name: "Sushi", products: nil, image: UIImage(named: "p5")!)
        
        groups.append(pizzaGroup)
        groups.append(burgerGroup)
        groups.append(sushiGroup)
    }
    
}






// MARK: - String EXT

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAtributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: fontAtributes)
        return ceil(size.width)
    }
}
