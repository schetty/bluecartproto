//
//  ViewController.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-15.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let product1 = Product.init(productSupplier: "Atlantic Seafood", productName: "Fresh Sea Bream", skuNumber: "12345", originalPrice: 10.99, discountedPrice: 9.99, unitOfMeasure: "/LB")
    let product2 = Product.init(productSupplier: "Sunny Produce", productName: "Organic Mangoes", skuNumber: "OM193", originalPrice: 3.10, discountedPrice: 2.90, unitOfMeasure: "/LB")
    let product3 = Product.init(productSupplier: "Glaze Doughnuts", productName: "Double Chocolate Coffee Bean", skuNumber: "FS193", originalPrice: 13.10, discountedPrice: 12.90, unitOfMeasure: "/Dozen")
    
    var productsArray: [Product] = []

    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        productTableView.delegate = self
        productTableView.dataSource = self
        
        productsArray = [product1, product2, product3]
        
        productTableView.reloadData()

        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if (indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellType1", for: indexPath) as! Type1Cell
                cell.configureWithCellType(product: productsArray[indexPath.row])
                return cell
                
            }
                
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellType2", for: indexPath) as! Type2Cell
                cell.configureWithCellType(product: productsArray[indexPath.row])
                return cell
            }
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
}


