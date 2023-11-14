//
//  HeaderLabel.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 14.11.2023.
//

import UIKit

class HeaderLabel: UILabel {
    convenience init(text: String){
        self.init()
        self.text = text
        
        configure()
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        font = .soraSemiBold18()
        textColor = .specialBlack
    }
}
