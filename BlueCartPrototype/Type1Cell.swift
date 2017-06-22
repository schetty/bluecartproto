//
//  Type1Cell.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-15.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class Type1Cell: UITableViewCell {
    
    var product: Product!

    @IBOutlet weak var supplierNameLabel: UILabel!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var SKUNumberLabel: UILabel!

    @IBOutlet weak var pricePerUnitLabel: UILabel!
    
    @IBOutlet weak var discountedPriceLabel: UILabel!
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var unitOfMeasureLabel: UILabel!
    
    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBOutlet weak var addedButton: UIButton!
    
    @IBOutlet weak var chooseUnitButton: UIButton!
    
    
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
    

    
    public func configureWithCellType(product: Product) {
        
        self.supplierNameLabel.text = product.productSupplier
        self.productNameLabel.text = product.productName
        self.SKUNumberLabel.text = product.skuNumber
        self.foodImageView.image = product.itemPhoto
        
        let formattedDiscPrice = Double(product.discountedPrice).format(f: 2)
        let formattedOrigPrice = Double(product.originalPrice).format(f: 2)
        
        if (product.discountedPrice < product.originalPrice && product.discountedPrice > 0) {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$" + String(formattedOrigPrice))
            attributeString.addAttribute(NSBaselineOffsetAttributeName, value: 0, range: NSMakeRange(0, attributeString.length))
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
            
            attributeString.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.magnesium(), range: NSMakeRange(0, attributeString.length))

            self.pricePerUnitLabel.attributedText = attributeString
        }
        else {
            
            self.pricePerUnitLabel.text = "$" + String(describing: formattedOrigPrice)
        }
        self.discountedPriceLabel.text = "$" + String(formattedDiscPrice)
        self.unitOfMeasureLabel.text = product.unitOfMeasure
    }

    func configureWithCellType2(product: Product) {
        self.supplierNameLabel.text = product.productSupplier
        self.productNameLabel.text = product.productName
        self.SKUNumberLabel.text = product.skuNumber
        
        let formattedDiscPrice = Double(product.discountedPrice).format(f: 2)
        let formattedOrigPrice = Double(product.originalPrice).format(f: 2)
        
        if ((product.discountedPrice) < product.originalPrice) {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$" + String(describing: formattedOrigPrice))
            attributeString.addAttribute(NSBaselineOffsetAttributeName, value: 0, range: NSMakeRange(0, attributeString.length))
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
            self.pricePerUnitLabel.attributedText = attributeString
        }
        else {
            self.pricePerUnitLabel.text = "$" + formattedOrigPrice
        }
        self.discountedPriceLabel.text = "$" + formattedDiscPrice
        self.unitOfMeasureLabel.text = product.unitOfMeasure
        
        chooseUnitButton.layer.borderColor = UIColor(red:0.09, green:0.53, blue:0.98, alpha:1.00).cgColor
    }
}
