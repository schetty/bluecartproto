//
//  Type2CollectionViewCell.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-19.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class Type2CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionViewCellView: UIView!
    @IBOutlet weak var distributorLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editNoteButton: UIButton!
    @IBOutlet weak var deliveryDateButton: UIButton!

    func configureCellWithColor(priceColor: UIColor, borderColor: CGColor, priceStr: String, distributorName: String, numberOfItems: String) {
        
        priceLabel.textColor = priceColor
        distributorLabel.text = distributorName
        numberOfItemsLabel.text = numberOfItems
        priceLabel.text = "$" + priceStr
        collectionViewCellView.layer.borderColor = borderColor
        collectionViewCellView.layer.borderWidth = 1.5
        collectionViewCellView.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.aluminum().cgColor
        deleteButton.layer.borderColor = UIColor(red:0.36, green:0.36, blue:0.36, alpha:1.00).cgColor
        editNoteButton.layer.borderColor = UIColor(red:0.96, green:0.67, blue:0.17, alpha:1.00).cgColor
        deliveryDateButton.layer.borderColor = UIColor(red:0.17, green:0.29, blue:0.35, alpha:1.00).cgColor
        
    }
    

}
