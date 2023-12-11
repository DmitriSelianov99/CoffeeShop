//
//  Separator.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 07.12.2023.
//

import UIKit

class Separator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(height: CGFloat){
        self.init()
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialSepartor
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
