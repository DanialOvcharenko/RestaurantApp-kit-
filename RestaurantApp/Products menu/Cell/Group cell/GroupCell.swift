//
//  GroupCell.swift
//  CollectionViewTesting
//
//  Created by Mac on 06.02.2023.
//

import UIKit

class GroupCell: UICollectionViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var underName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.groupName.text = nil
        self.underName.backgroundColor = UIColor(named: "Background")
    }
    
    func setupCell(group:Group, isSelected:Bool) {
        self.groupName.text = group.name
        if isSelected{
            self.underName.backgroundColor = .orange
        } else {
            self.underName.backgroundColor = UIColor(named: "Background")
        }
    }

}
