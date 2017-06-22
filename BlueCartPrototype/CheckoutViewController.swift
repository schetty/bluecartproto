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
    

    var price: String = ""
    var arrayOfOrders = [Order]()
    
    
    // set up view
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let noOfItems = String(arrayOfOrders[indexPath.row].quantity) + " items"
        self.price = nsnumPriceVal.stringValue
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
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type2CollectionViewCell", for: indexPath as IndexPath) as! Type1CollectionViewCell
            
            cell.configureCellWithColor(priceColor: UIColor.black, borderColor: UIColor.chicago().cgColor, priceStr: price, distributorName: distName, numberOfItems: noOfItems, andMessage: "")
            
            return cell
            
        }
            
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type1CollectionViewCell", for: indexPath as IndexPath) as! Type1CollectionViewCell
            cell.distributorNameLabel.text = "Distributor will appear here"
            return cell
        }
        
    }
    
    
    // headers and footers for checkout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if (section == 0) {
           return CGSize(width: view.frame.width, height: 0)
        }
        else {
            return CGSize(width: view.frame.width, height: 80)
        }
    }
    
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
            
            if (section == 1) {
            let placeAllOrdersFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentiferForFooter, for: indexPath) as! CheckoutCollectionReusableView
            placeAllOrdersFooter.configureWithPrice(price: self.price)
            return placeAllOrdersFooter
            }
            
            else {
                let placeAllOrdersFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentiferForFooter, for: indexPath) as! CheckoutCollectionReusableView
                
                placeAllOrdersFooter.isHidden = true
                
                return placeAllOrdersFooter
            }
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
}
