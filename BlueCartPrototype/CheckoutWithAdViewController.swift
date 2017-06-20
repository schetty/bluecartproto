//
//  CheckoutWithAdViewController.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-19.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class CheckoutWithAdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //IB actions
    @IBAction func didTapEmpty(_ sender: Any) {
    }
    
    //IB outlets
    @IBOutlet weak var stickyFooterView: UIView!
    
    //dummy data
    let order1 = Order.init(distributorName: "Ashley's Sweet Pie", daysForDelivery: ["M", "Tu", "W", "Th", "F", "Sa", "Su"], quantity: 4, orderPrice: 340.99, isReady: true, orderMessage: "$25 Away From Order Minimum")
    
    let order2 = Order.init(distributorName: "Jag's Tofu Factory", daysForDelivery: ["M", "Tu", "W", "Th", "F", "Sa", "Su"], quantity: 4, orderPrice: 200.00
        , isReady: false, orderMessage: "Must select a delivery date for this order")
    
    
    var price: String = ""
    var arrayOfOrders = [Order]()
    var arrayOfBottomOrders = [Order]()
    
    
    // set up view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfOrders = [order1, order2]

      stickyFooterView.layer.borderWidth = 1
        stickyFooterView.layer.borderColor = UIColor.aluminum().cgColor
    }

    // collection view required & optional protocol
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrayOfOrders.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let nsnumPriceVal = NSNumber(value: arrayOfOrders[indexPath.row].orderPrice)
//        let section = indexPath.section
        
        let delDate = "June 1, 2017"
        let distName = arrayOfOrders[indexPath.row].distributorName
        let noOfItems = String(arrayOfOrders[indexPath.row].quantity) + " items"
        self.price = nsnumPriceVal.stringValue
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type2CollectionViewCell", for: indexPath as IndexPath) as! Type2CollectionViewCell
        
        cell.configureCellWithColor(priceColor: UIColor.black, borderColor: UIColor.aluminum().cgColor, priceStr: price, distributorName: distName, numberOfItems: noOfItems)
        
        cell.deliveryDateButton.titleLabel?.text = delDate
        
        return cell
    }
}
