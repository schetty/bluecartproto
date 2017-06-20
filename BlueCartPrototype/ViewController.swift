//
//  ViewController.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-15.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //alert view
   
    func addedToCartAlert() {
    let appearance = SCLAlertView.SCLAppearance(
        kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
        kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
        kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
        showCloseButton: true
    )
     SCLAlertView().showTitle(
    "Added to Cart",
    subTitle: "Operation successfully completed.",
    duration: 2.0,
    completeText: "Done",
    style: .success,
    colorStyle: 0xA429FF,
    colorTextButton: 0xFFFFFF
    )
    }
    // functions
    @IBAction func didPressAddToCart(_ sender: Any) {
        redCartBoxView.isHidden = false
        itemsInCartLabel.text = "5"
        itemsInCartLabel.isHidden = false
        
        SCLAlertView().showInfo("Added to your cart", subTitle: "5 Sea Breams")

    }
    
    
    //dummy data
    let product1 = Product.init(productSupplier: "Atlantic Seafood", productName: "Fresh Sea Bream", skuNumber: "12345", originalPrice: 10.99, discountedPrice: 9.99, unitOfMeasure: "/LB")
    
    let product2 = Product.init(productSupplier: "Sunny Produce", productName: "Organic Mangoes", skuNumber: "OM193", originalPrice: 3.10, discountedPrice: 2.90, unitOfMeasure: "/LB")
    
    let product3 = Product.init(productSupplier: "Glaze Doughnuts", productName: "Double Chocolate Coffee Bean", skuNumber: "FS193", originalPrice: 13.10, discountedPrice: 12.90, unitOfMeasure: "/Dozen")
    
    var productsArray: [Product] = []
    
    
    
    //outlets
    @IBOutlet weak var productTableView: UITableView!
    
    @IBOutlet weak var redCartBoxView: UILabel!
    
    @IBOutlet weak var itemsInCartLabel: UILabel!
    
    

    // set up views
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
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
        else if (indexPath.row == 2) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellType1", for: indexPath) as! Type1Cell
            cell.configureWithCellType(product: productsArray[indexPath.row])
            cell.foodImageView.image = #imageLiteral(resourceName: "doughnut")
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


