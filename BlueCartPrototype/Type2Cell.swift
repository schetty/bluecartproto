//
//  Type2Cell.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-15.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class Type2Cell: UITableViewCell {

    @IBOutlet weak var supplierNameLabel: UILabel!

    @IBOutlet weak var productNameLabel: UILabel!

    @IBOutlet weak var SKUNumber: UILabel!
    
    @IBOutlet weak var pricePerUnitLabel: UILabel!
    
    @IBOutlet weak var discountedPriceLabel: UILabel!
    
    @IBOutlet weak var unitOfMeasureLabel: UILabel!

    @IBOutlet weak var chooseUnitButton: UIButton!
    
    func configureWithCellType(product: Product) {
        self.supplierNameLabel.text = product.productSupplier
        self.productNameLabel.text = product.productName
        self.SKUNumber.text = product.skuNumber
        if (product.discountedPrice < product.originalPrice) {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$" + String(product.originalPrice))
            attributeString.addAttribute(NSBaselineOffsetAttributeName, value: 0, range: NSMakeRange(0, attributeString.length))
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
            self.pricePerUnitLabel.attributedText = attributeString
        }
        else {
            self.pricePerUnitLabel.text = "$" + String(product.originalPrice)
        }
        self.discountedPriceLabel.text = "$" + String(product.discountedPrice)
        self.unitOfMeasureLabel.text = product.unitOfMeasure
        
          chooseUnitButton.layer.borderColor = UIColor(red:0.09, green:0.53, blue:0.98, alpha:1.00).cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
