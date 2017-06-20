//
//  CustomQuantityCounter.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-20.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class CustomQuantityCounter: UIView {
        
    let leftButton = UIButton()
    let rightButton = UIButton()
    let label = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    
    func setup() {
        
        //left button
        leftButton.setTitle("-", for: .normal)
        leftButton.setTitleColor(.black, for: .normal)
        leftButton.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
        addSubview(leftButton)
        
        //right button
        rightButton.setTitle("+", for: .normal)
        rightButton.setTitleColor(.black, for: .normal)
        rightButton.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
        addSubview(rightButton)
        
        //counting label
        label.text = "18"
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.aluminum().cgColor
        label.font = UIFont(name: "AvenirNext", size: 24)
        label.isUserInteractionEnabled = true
        addSubview(label)
        
        //gesture recognizers

        
        
        func pressedAction(_ sender: UIButton) {
            // do your stuff here
            print("you clicked on button \(sender.tag)")
        }
        
        rightButton.addTarget(self, action: Selector(("handleTap:")), for: UIControlEvents.touchUpInside)
        leftButton.addTarget(self, action: Selector(("buttonTouchUp:")), for: UIControlEvents.touchUpInside)

        // MARK: Button Event Actions
        func leftButtonTouchDown(button: UIButton) {
            value -= 1
        }
        
        func rightButtonTouchDown(button: UIButton) {
            value += 1
        }
    
        
        func handleTap(_ tapGesture : UITapGestureRecognizer) {
            
            if tapGesture.state == .ended {
                value += 1
            }
        }
    }
    
    
    
    override func layoutSubviews() {
        
        let labelWidthWeight: CGFloat = 0.5
        
        let buttonWidth = bounds.size.width * ((1 - labelWidthWeight) / 2)
        let labelWidth = bounds.size.width * labelWidthWeight
        
        leftButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: bounds.size.height)
        leftButton.transform = CGAffineTransform( translationX: 5, y: 0 )

        
        leftButton.layer.cornerRadius = 5
        leftButton.layer.borderWidth = 1.4
        leftButton.layer.borderColor = UIColor.aluminum().cgColor
        
        label.frame = CGRect(x: buttonWidth, y: 0, width: labelWidth, height: bounds.size.height)
        
        rightButton.frame = CGRect(x: labelWidth + buttonWidth, y: 0, width: buttonWidth, height: bounds.size.height)
        
        rightButton.layer.cornerRadius = 5
        rightButton.layer.borderWidth = 1.4
        rightButton.layer.borderColor = UIColor.aluminum().cgColor
        rightButton.transform = CGAffineTransform( translationX: -5, y: 0 )

    }
    
    var value = 0 {
        didSet {
            label.text = String(value)
            
        }
        
    }
}
