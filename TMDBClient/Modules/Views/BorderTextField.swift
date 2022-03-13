//
//  BorderTextField.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit

@IBDesignable
class BorderTextField: UITextField {
 @IBInspectable var borderColor: UIColor? {
    didSet {
        layer.borderColor = borderColor?.cgColor
    }
 }
 @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
        layer.borderWidth = borderWidth
    }
 }
}
