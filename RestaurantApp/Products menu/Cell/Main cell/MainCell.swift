//
//  MainCell.swift
//  CollectionViewTesting
//
//  Created by Mac on 07.02.2023.
//

import UIKit

class MainCell: UICollectionViewCell {

    @IBOutlet weak var imageGroup: UIImageView!
    @IBOutlet weak var nameGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageGroup.image = nil
        self.nameGroup.text = nil
    }
    
    func setupCell(group:Group){
        self.imageGroup.image = group.image
        self.nameGroup.text = group.name
    }

}
