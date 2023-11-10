//
//  CustomLabel.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 10.11.2023.
//

import UIKit

class CustomLabel: UILabel {
    convenience init(font: UIFont, textColor: UIColor, text: String){
        self.init()
        
        self.font = font
        self.textColor = textColor
        self.text = text
        
        configure()
    }
    
    private func configure(){
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
