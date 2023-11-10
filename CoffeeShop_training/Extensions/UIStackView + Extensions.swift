//
//  UIStackView + Extensions.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 09.11.2023.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat){
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = .equalSpacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
