//
//  SizeCollectionViewCell.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 14.11.2023.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {
    
    private let sizeLabel = CustomLabel(font: .soraRegular14()!, textColor: .specialBlack, text: "S")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialCizeColor
                layer.borderColor = UIColor.specialOrange.cgColor
                sizeLabel.textColor = .specialOrange
            } else {
                backgroundColor = .none
                layer.borderColor = UIColor.specialBorder.cgColor
                sizeLabel.textColor = .specialBlack
            }
        }
    }
    
    private func setupViews(){
        backgroundColor = .none
        layer.borderWidth = 1
        layer.cornerRadius = 12
        layer.borderColor = UIColor.specialBorder.cgColor
        
        sizeLabel.textAlignment = .center
        addSubview(sizeLabel)
        
    }
    
    public func setSize(size: String){
        sizeLabel.text = size
    }
}

extension SizeCollectionViewCell {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: topAnchor),
            sizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sizeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            sizeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
