//
//  CheckoutViewController.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-16.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // IB outlets
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // static variables for reuse ids
    let reuseIdentifierForCheckoutHeader = "checkoutOrderStatus"
    let reuseIdentiferForFooter = "placeAllOrdersFooter"
    
    //dummy data
    let order1 = Order.init(distributorName: "Ashley's Sweet Pie", daysForDelivery: ["M", "Tu", "W", "Th", "F", "Sa", "Su"], quantity: 4, orderPrice: 340.99, isReady: true, orderMessage: "$25 Away From Order Minimum")
    
    let order2 = Order.init(distributorName: "Jag's Tofu Factory", daysForDelivery: ["M", "Tu", "W", "Th", "F", "Sa", "Su"], quantity: 4, orderPrice: 200.01, isReady: false, orderMessage: "Must select a delivery date for this order")
    

    
    var arrayOfOrders = [Order]()
    var arrayOfBottomOrders = [Order]()
    
    
    // set up view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfOrders = [order1, order2]
    }
    
    
    // collection view required & optional protocol
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
            return arrayOfOrders.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let nsnumPriceVal = NSNumber(value: arrayOfOrders[indexPath.row].orderPrice)
        let section = indexPath.section
        let distName = arrayOfOrders[indexPath.row].distributorName
        let noOfItems = String(arrayOfOrders[indexPath.row].quantity) + "items"
        let price = nsnumPriceVal.stringValue
        let orderMsg = arrayOfOrders[indexPath.row].orderMessage
        
      
        
        
        if (section == 0 && arrayOfOrders[indexPath.row].orderMessage == "$25 Away From Order Minimum") {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type1CollectionViewCell", for: indexPath as IndexPath) as! Type1CollectionViewCell
            cell.configureCellWithColor(priceColor: UIColor.fireEngineRed(), borderColor: UIColor.fireEngineRed().cgColor, priceStr: price, distributorName: distName, numberOfItems: noOfItems, andMessage: orderMsg)
            
            return cell
            
        }
            
        else if (section == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type1CollectionViewCell", for: indexPath as IndexPath) as! Type1CollectionViewCell
            cell.configureCellWithColor(priceColor: UIColor.black, borderColor: UIColor.fireEngineRed().cgColor, priceStr: price, distributorName: distName, numberOfItems: noOfItems, andMessage: orderMsg)
            
            return cell
        }
            
        else if (section == 1) {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type2CollectionViewCell", for: indexPath as IndexPath) as! Type2CollectionViewCell
            
            cell.configureCellWithColor(priceColor: UIColor.black, borderColor: UIColor.chicago().cgColor, priceStr: price, distributorName: distName, numberOfItems: noOfItems)
            
            return cell
            
        }
            
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type1CollectionViewCell", for: indexPath as IndexPath) as! Type1CollectionViewCell
            cell.distributorNameLabel.text = "Distributor will appear here"
            return cell
        }
        
    }
    
    // headers and footers for checkout
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = indexPath.section

        switch kind {
        case UICollectionElementKindSectionHeader:
            
            switch section {
            case 0:
                let checkoutHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifierForCheckoutHeader, for: indexPath) as! CheckoutHeader
                checkoutHeader.checkoutHeaderLabel.text = "- ATTENTION NEEDED -"
                checkoutHeader.checkoutHeaderLabel.textColor = UIColor.fireEngineRed()
                return checkoutHeader
            case 1:
                let checkoutHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifierForCheckoutHeader, for: indexPath) as! CheckoutHeader
                checkoutHeader.checkoutHeaderLabel.text = "- READY TO GO -"
                checkoutHeader.checkoutHeaderLabel.textColor = UIColor.black
                return checkoutHeader
                
            default:
                let checkoutHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifierForCheckoutHeader, for: indexPath) as! CheckoutHeader
                checkoutHeader.checkoutHeaderLabel.text = ""
                return checkoutHeader
            }
            
        case UICollectionElementKindSectionFooter:
            if (section > 0) {
            let placeAllOrdersFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentiferForFooter, for: indexPath) as! CheckoutCollectionReusableView
            return placeAllOrdersFooter
                
            }
            else {
                return UICollectionReusableView()
            }
            
        default:
            return UICollectionReusableView()
        }
    }
    
}
