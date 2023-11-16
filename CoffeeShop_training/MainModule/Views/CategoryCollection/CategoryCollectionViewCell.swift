//
//  CategoryCollectionViewCell.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 10.11.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private var coffeeType = CoffeeTypeModel()
    
    private let coffeeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .soraRegular14()
        label.textColor = .specialGreen
        label.text = "Cappuccino"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialOrange
                coffeeNameLabel.textColor = .white
                coffeeNameLabel.font = .soraSemiBold14()
            } else {
                backgroundColor = .white
                coffeeNameLabel.textColor = .specialGreen
                coffeeNameLabel.font = .soraRegular14()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        layer.cornerRadius = 12
        backgroundColor = .white
        addSubview(coffeeNameLabel)
    }
    
    public func configure(model: CoffeeTypeModel){
        coffeeType = model
        coffeeNameLabel.text = model.type
    }
}

extension CategoryCollectionViewCell {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            coffeeNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            coffeeNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
