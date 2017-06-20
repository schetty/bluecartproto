//
//  Type1Cell.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-15.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class Type1Cell: UITableViewCell {
    
    var product: Product?

    @IBOutlet weak var supplierNameLabel: UILabel!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var SKUNumber: UILabel!

    @IBOutlet weak var pricePerUnitLabel: UILabel!
    
    @IBOutlet weak var discountedPriceLabel: UILabel!
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var unitOfMeasureLabel: UILabel!
    
    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBOutlet weak var addedButton: UIButton!
    
    @IBAction func addToCartButtonTapped(_ sender: Any) {
        if (addToCartButton.isHidden == false) {
    addToCartButton.isHidden = true
    addedButton.isHidden = false
        }
        else {
            addToCartButton.isHidden = false
            addedButton.isHidden = true
        }
    }
    
    @IBAction func didPressAddToCart(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureWithCellType(product: Product) {
        self.supplierNameLabel.text = product.productSupplier
        self.productNameLabel.text = product.productName
        self.SKUNumber.text = product.skuNumber
        
        if (product.discountedPrice < product.originalPrice) {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$" + String(product.originalPrice))
            attributeString.addAttribute(NSBaselineOffsetAttributeName, value: 0, range: NSMakeRange(0, attributeString.length))
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
            
            attributeString.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.magnesium(), range: NSMakeRange(0, attributeString.length))

            self.pricePerUnitLabel.attributedText = attributeString
        }
        else {
            self.pricePerUnitLabel.text = "$" + String(product.originalPrice)
        }
        self.discountedPriceLabel.text = "$" + String(product.discountedPrice)
        self.unitOfMeasureLabel.text = product.unitOfMeasure
    }

}
