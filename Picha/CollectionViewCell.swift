//
//  CollectionViewCell.swift
//  Picha
//
//  Created by Edith Dande on 13/06/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    func setLabel(label:String) {
            mainLabel.text = label
        }
    
}
