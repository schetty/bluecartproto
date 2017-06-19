//
//  CustomStepper.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-16.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit

class CustomStepper: UIStepper {
    
    let leftButton = UIButton()
    let rightButton = UIButton()
    let label = UILabel()
    var startValue = 0 {
        didSet {
            label.text = String(startValue)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
   
    
    /// Text on the left button. Be sure that it fits in the button. Defaults to "-".
     var leftButtonText: String = "-" {
        didSet {
            leftButton.setTitle(leftButtonText, for: .normal)
        }
    }
    
    /// Text on the right button. Be sure that it fits in the button. Defaults to "+".
     var rightButtonText: String = "+" {
        didSet {
            rightButton.setTitle(rightButtonText, for: .normal)
        }
    }
    
    /// Text color of the buttons. Defaults to white.
     var buttonsTextColor: UIColor = UIColor.white {
        didSet {
            for button in [leftButton, rightButton] {
                button.setTitleColor(buttonsTextColor, for: .normal)
            }
        }
    }
    
    /// Background color of the buttons. Defaults to dark blue.
     var buttonsBackgroundColor: UIColor = UIColor(red:0.21, green:0.5, blue:0.74, alpha:1) {
        didSet {
            for button in [leftButton, rightButton] {
                button.backgroundColor = buttonsBackgroundColor
            }
            backgroundColor = buttonsBackgroundColor
        }
    }
    
    /// Font of the buttons. Defaults to AvenirNext-Bold, 20.0 points in size.
    public var buttonsFont = UIFont(name: "Apercu", size: 15.0)! {
        didSet {
            for button in [leftButton, rightButton] {
                button.titleLabel?.font = buttonsFont
            }
        }
    }
    
    /// Text color of the middle label. Defaults to white.
    var labelTextColor: UIColor = UIColor.darkGray {
        didSet {
            label.textColor = labelTextColor
        }
    }
    
    /// Text color of the middle label.
     var labelBackgroundColor: UIColor = UIColor.darkGray {
        didSet {
            label.backgroundColor = labelBackgroundColor
        }
    }
    
    /// Font of the middle label.
    public var labelFont = UIFont(name: "Apercu", size: 15.0)! {
        didSet {
            label.font = labelFont
        }
    }
    
    func setup() {
        
        leftButton.setTitle("-", for: .normal)
        leftButton.backgroundColor = UIColor.lightGray()
        addSubview(leftButton)
        
        rightButton.setTitle("+", for: .normal)
        rightButton.backgroundColor = UIColor.lightGray()
        addSubview(rightButton)
        
        label.text = "0"
        label.font = UIFont().apercu(size: 20)
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 4
        label.layer.borderColor = UIColor.aluminum().cgColor
        addSubview(label)
        
    }
    
    override public func layoutSubviews() {
        let labelWidthWeight: CGFloat = 0.5
        
        let buttonWidth = bounds.size.width * ((1 - labelWidthWeight) / 2)
        let labelWidth = bounds.size.width * labelWidthWeight
        
        leftButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: bounds.size.height)
        leftButton.layer.cornerRadius = 4
        leftButton.clipsToBounds = true


        
        label.frame = CGRect(x: buttonWidth, y: 0, width: labelWidth, height: bounds.size.height)
        
        rightButton.frame = CGRect(x: labelWidth + buttonWidth, y: 0, width: buttonWidth, height: bounds.size.height)
        rightButton.layer.cornerRadius = 4
        rightButton.clipsToBounds = true

        
        leftButton.addTarget(self, action: Selector(("leftButtonTouchDown:")), for: .touchDown)
        leftButton.addTarget(self, action: Selector(("buttonTouchUpInside:")), for: .touchUpInside)
        
    }
    
    
    func leftButtonTouchUpInside(button: UIButton) {
        startValue -= 1
        label.text = String(startValue)
        
    }
    
    func leftButtonTouchDown(button: UIButton) {
        startValue -= 1
        label.text = String(startValue)
        
    }
    
    func rightButtonTouchUpInside(button: UIButton) {
        startValue += 1
        label.text = String(startValue)

    }
    


}
