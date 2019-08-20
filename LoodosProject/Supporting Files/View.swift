//
//  View.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 19.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var ViewCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
    @IBInspectable var CornerWidth: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            
            return layer.borderWidth
            
        }
        set {
            
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
        set {
            
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOffset = CGSize.zero
            layer.shadowOpacity = 0.4
            layer.shadowRadius = shadowRadius
        }
    }
}
