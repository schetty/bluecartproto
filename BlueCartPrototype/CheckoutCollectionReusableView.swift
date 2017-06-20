//
//  CheckoutCollectionReusableView.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-19.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class CheckoutCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var footerBackgroundView: UIView!
    @IBOutlet weak var placeAllMyOrdersButton: UIButton!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    func configureWithPrice(price: String) {
        totalPriceLabel.text = "$5,392.39"
    }
}
