//
//  Product.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-15.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

struct Product {
    
    let productSupplier: String!
    let productName: String!
    let skuNumber: String
    let originalPrice: Double
    let discountedPrice: Double
    let unitOfMeasure: String
    let itemDescription: String
    let arrayOfQuantitiesAvail: [String]?
    let arrayOfPricesForQuantities: [String]?
    let itemPhoto: UIImage
    var designatedPrice = 0.000
}
