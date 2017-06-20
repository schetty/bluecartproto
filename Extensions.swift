//
//  Extensions.swift
//  BlueCartPrototype
//
//  Created by naomi schettini on 2017-06-16.
//  Copyright © 2017 naomi schettini. All rights reserved.
//

import UIKit


    extension UIColor {
        
        class func dodgerBlue() -> UIColor {
            
            return UIColor(red:0.09, green:0.53, blue:0.98, alpha:1.00)
            
        }
    }

extension UIColor {
    
    class func atlantis() -> UIColor {
        
       return UIColor(red:0.50, green:0.82, blue:0.21, alpha:1.00)
        
    }
}

extension UIColor {
    
    class func magnesium() -> UIColor {
        
        return UIColor(red:0.70, green:0.70, blue:0.70, alpha:1.00)
        
    }
}

extension UIColor {
    
    class func casablanca() -> UIColor {
        
        return UIColor(red:0.96, green:0.69, blue:0.29, alpha:1.00)
        
    }
}

extension UIColor {
    
    class func lightGray() -> UIColor {
        
        return UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.00)

    }
}

extension UIColor {
    
    class func aluminum() -> UIColor {
        
        return UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.00)

        
    }
}

extension UIColor {
    
    class func chicago() -> UIColor {
        
        return UIColor(red:0.36, green:0.36, blue:0.36, alpha:1.00)

        
        
    }
}

extension UIColor {
    
    class func fireEngineRed() -> UIColor {
        
        return UIColor(red:0.80, green:0.10, blue:0.18, alpha:1.00)
        
        
    }
}


extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}

extension UIFont {
    func apercu(size:CGFloat) -> UIFont {
        return UIFont(name: "Apercu.otf", size: size)!
    }
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer();
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x:0, y:self.frame.height - thickness, width:self.frame.width, height:thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x:0, y:0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x:self.frame.width - thickness, y: 0, width: thickness, height:self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}
