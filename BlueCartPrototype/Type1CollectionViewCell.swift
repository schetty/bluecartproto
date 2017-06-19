//
//  Type1CollectionViewCell.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-16.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class Type1CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionViewCellView: UIView!
    
    @IBOutlet weak var distributorNameLabel: UILabel!
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var addNoteButton: UIButton!
    
    @IBOutlet weak var deliveryDateButton: UIButton!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var orderMessage: UILabel!
    
    func configureCellWithColor(priceColor: UIColor, borderColor: CGColor, priceStr: String, distributorName: String, numberOfItems: String, andMessage: String) {
        priceLabel.textColor = priceColor
        distributorNameLabel.text = distributorName
        numberOfItemsLabel.text = numberOfItems
        priceLabel.text = "$" + priceStr
        orderMessage.text = andMessage
        collectionViewCellView.layer.borderColor = borderColor
        collectionViewCellView.layer.borderWidth = 1.5
        collectionViewCellView.layer.cornerRadius = 5
        deleteButton.layer.borderColor = UIColor.aluminum().cgColor
        addNoteButton.layer.borderColor = UIColor.aluminum().cgColor
        deliveryDateButton.layer.borderColor = UIColor.aluminum().cgColor
        
        }
    
}
