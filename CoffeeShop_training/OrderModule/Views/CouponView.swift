//
//  CouponView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 07.12.2023.
//

import UIKit

class CouponView: UIView {
    
    private let percentImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "percent")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let discountLabel = CustomLabel(font: .soraSemiBold14()!, textColor: .specialBlack, text: "No Discounts")
    
    private let arrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow-left")
        image.transform = image.transform.rotated(by: .pi)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 14
        layer.borderWidth = 1
        layer.borderColor = UIColor.specialSepartor.cgColor
        
        addSubview(percentImage)
        addSubview(discountLabel)
        addSubview(arrow)
    }
}

extension CouponView {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            percentImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            percentImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            percentImage.heightAnchor.constraint(equalToConstant: 24),
            percentImage.widthAnchor.constraint(equalToConstant: 24),
            
            discountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            discountLabel.leadingAnchor.constraint(equalTo: percentImage.trailingAnchor, constant: 12),
            discountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            arrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            arrow.heightAnchor.constraint(equalToConstant: 20),
            arrow.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}
