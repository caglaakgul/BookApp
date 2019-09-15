//
//  DesignableView.swift
//  BookApp
//
//  Created by CGL on 9.09.2019.
//  Copyright © 2019 cgl. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableView: UIView {
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    @IBInspectable var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
}
