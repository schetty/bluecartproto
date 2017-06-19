//
//  FeaturedProductViewController.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-16.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class FeaturedProductViewController: UIViewController {
    
    @IBOutlet weak var footerBar: UIView!
    
    @IBOutlet weak var FourPackButton: UIButton!
    
    @IBOutlet weak var TwelvePackButton: UIButton!
    
    @IBOutlet weak var TwentyPackButton: UIButton!
    
    @IBOutlet weak var TwentyFourPackButton: UIButton!
    
    @IBAction func didTapFourPack(_ sender: Any) {
        
        if (FourPackButton.layer.borderColor == UIColor.magnesium().cgColor) {
            FourPackButton.layer.borderColor = UIColor.casablanca().cgColor
        }
        else {
            FourPackButton.layer.borderColor = UIColor.magnesium().cgColor
        }
    }
    
    @IBAction func didTapTwelvePack(_ sender: Any) {
        if (TwelvePackButton.layer.borderColor == UIColor.magnesium().cgColor) {
        TwelvePackButton.layer.borderColor = UIColor.casablanca().cgColor
        }
        else {
               TwelvePackButton.layer.borderColor = UIColor.magnesium().cgColor
        }
    }
    
    @IBAction func didTapTwentyPack(_ sender: Any) {
        if (TwentyPackButton.layer.borderColor == UIColor.magnesium().cgColor) {
            TwentyPackButton.layer.borderColor = UIColor.casablanca().cgColor
        }
        else {
            TwentyPackButton.layer.borderColor = UIColor.magnesium().cgColor
        }
    }
    
    @IBAction func didTapTwentyFourPack(_ sender: Any) {
        if (TwentyFourPackButton.layer.borderColor == UIColor.magnesium().cgColor) {
            TwentyFourPackButton.layer.borderColor = UIColor.casablanca().cgColor
        }
        else {
            TwentyFourPackButton.layer.borderColor = UIColor.magnesium().cgColor
        }
    }
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FourPackButton.layer.borderColor = UIColor.magnesium().cgColor
        
        TwelvePackButton.layer.borderColor = UIColor.magnesium().cgColor
        
        TwentyPackButton.layer.borderColor = UIColor.magnesium().cgColor
        
        TwentyFourPackButton.layer.borderColor = UIColor.magnesium().cgColor
        
        footerBar.addTopBorderWithColor(color: UIColor.lightGray(), width: 1.0)
        
        
    }

 
}
