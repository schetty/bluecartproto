//
//  TopDealsViewController.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-15.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit
import SCLAlertView

class TopDealsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Variables
    var arrayOfItemsAddedToCart = [Product]()
    var productsArray = [Product]()
    
    //MARK: Constants
    let segueToViewController = "SegueToFeaturedProductVC"
    
    
    //MARK:  Functions
    
    func didPressAddToCart(_ sender: Any)
    {
        let addToCartButton = sender as? UIButton
        
    }
    //MARK:  Alert View
    
    
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
    
    func chooseQuantityAlert(quantities: [String], prices: [String]) {
        let alertView = SCLAlertView()
        alertView.addButton("\(quantities[0])", target:self, selector:Selector("\(quantities[1])"))
        alertView.addButton("Second Button") {
            print("Second button tapped")
        }
        alertView.showSuccess("Button View", subTitle: "This alert view has buttons")
        SCLAlertView().showTitle(
            "Choose the quantities for purchase",
            subTitle: "hello",
            duration: 10.0,
            completeText: "Done",
            style: .success,
            colorStyle: 0xA429FF,
            colorTextButton: 0xFFFFFF
        )
    }
    
    
    //MARK:  Dummy Data
    let product1 = Product.init(productSupplier: "Atlantic Seafood", productName: "Fresh Sea Bream", skuNumber: "12345", originalPrice: 10.99, discountedPrice: 9.99, unitOfMeasure: "/LB", itemDescription: "Caught weekly and imported from Portugal.", arrayOfQuantitiesAvail: [], arrayOfPricesForQuantities: [], itemPhoto: #imageLiteral(resourceName: "fishDefaultCellPhoto"), designatedPrice: 0.00)
    
    let product2 = Product.init(productSupplier: "Sunny Produce", productName: "Organic Mangoes", skuNumber: "OM193", originalPrice: 3.12, discountedPrice: 2.91, unitOfMeasure: "/LB", itemDescription: "Mangoes from Homestead, Miami, FL", arrayOfQuantitiesAvail: ["", "", ""], arrayOfPricesForQuantities: ["", ""], itemPhoto: #imageLiteral(resourceName: "mangoPicture"), designatedPrice: 2.00)
    
    let product3 = Product.init(productSupplier: "Glaze Doughnuts", productName: "Double Chocolate Coffee Bean", skuNumber: "FS193", originalPrice: 13.19, discountedPrice: 12.90, unitOfMeasure: "/Dozen", itemDescription: "Chocolate glazed doughnuts fried in avocado oil", arrayOfQuantitiesAvail: ["Dozen", "2 Dozen"],  arrayOfPricesForQuantities: ["$12.50", "$21.00"], itemPhoto: #imageLiteral(resourceName: "doughnut"), designatedPrice: 12.90)
    
    let product4 = Product.init(productSupplier: "Carousel", productName: "Stella Artois Premium Belgian Blonde Lager", skuNumber: "SS3234", originalPrice: 4.00, discountedPrice: 1.00, unitOfMeasure: "", itemDescription: "", arrayOfQuantitiesAvail: ["4-Pack", "12-pack", "20-pack", "24-pack"], arrayOfPricesForQuantities: ["$10.99", "$15.99", "$10.99", "$26.99"], itemPhoto: #imageLiteral(resourceName: "stella"), designatedPrice: 1.00)
    
    let product5 = Product.init(productSupplier: "Edible NYC", productName: "Sofie Belgian Style Farmhouse Ale 765ml", skuNumber: "YT4322", originalPrice: 5.22, discountedPrice: 3.45, unitOfMeasure: "", itemDescription: "Tart, dry, sparkling ale with spicy white pepper notes, a hint of orange peel and a creamy white finish.", arrayOfQuantitiesAvail: ["4-Pack", "765mL", "1/6 bbl", "1/2 bbl"], arrayOfPricesForQuantities: ["$10.99", "$8.99", "$118.00", "$225.99"], itemPhoto: #imageLiteral(resourceName: "sofiecraftbeer"), designatedPrice: 3.45)
    
    
    
    
    //MARK:  Outlets
    @IBOutlet weak var productTableView: UITableView!
    
    
    
    // MARK:  Set up views
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.reloadData()
        
        
        self.productsArray = [product1, product2, product3, product4, product5]
        
        
    }
    
    // MARK:  Table View Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let copiedArray = Array(self.productsArray)
        return copiedArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = self.productsArray[indexPath.row]
            if ((product.arrayOfQuantitiesAvail?.count != 0) && (product.arrayOfPricesForQuantities?.count != 0)) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellType2", for: indexPath) as! Type1Cell
                cell.configureWithCellType2(product: productsArray[indexPath.row])
                cell.foodImageView.image = product.itemPhoto
                return cell
            }
                
            else if ((product.arrayOfQuantitiesAvail?.count == 0) && (product.arrayOfPricesForQuantities?.count == 0)) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellType1", for: indexPath) as! Type1Cell
                cell.configureWithCellType(product: productsArray[indexPath.row])
                cell.foodImageView.image = product.itemPhoto
                return cell
            }
                
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellType1", for: indexPath) as! Type1Cell
                cell.configureWithCellType(product: productsArray[indexPath.row])
                cell.foodImageView.image = product.itemPhoto
                return cell
            }
        }
        
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! Type1Cell
        cell.addToCartButton.addTarget(self, action: #selector(self.didPressAddToCart(_:)), for: .touchUpInside)
        
       let desiredItem = cell.product
       let userCart = Cart.shared.convertProductToOrder(desiredItem)

//        if (desiredItem.discountedPrice < desiredItem.originalPrice && desiredItem.discountedPrice != 0) {
//            desiredItem.designatedPrice = desiredItem.discountedPrice
//            
//            let newOrder = Order.init(distributorName: product.productName, quantity: product.quantity, ["M", "Tu", "W", "Th", "F", "Sa", "Su"], orderPrice: product.designatedPrice, isReady: true, orderMessage: "Must select a delivery date for this order")
//            return newOrder
//            
        }
    }



