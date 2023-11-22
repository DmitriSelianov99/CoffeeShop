//
//  LikedCollectionViewCell.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 21.11.2023.
//

import UIKit

class LikedTableViewCell: UITableViewCell {
    
    static let idCell = "idCell"
    
    private let photoImageView: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "cappucino")
        photo.layer.cornerRadius = 12
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    private let nameLabel = CustomLabel(font: .soraSemiBold16()!, textColor: .specialBlack, text: "Cappucino")
    private let configurationProductLabel = CustomLabel(font: .soraRegular12()!, textColor: .specialGrey, text: "with Chocolate")
    private var labelStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(photoImageView)
        
        labelStackView = UIStackView(arrangedSubviews: [nameLabel, configurationProductLabel], axis: .vertical, spacing: 4)
        addSubview(labelStackView)
    }
    
    public func configure(model: CoffeeModel){
        
        nameLabel.text = model.coffeeType?.type
        configurationProductLabel.text = model.coffeeConfig
        
        guard let imageData = model.coffeeImage, let image = UIImage(data: imageData) else { return }
        photoImageView.image = image
    }
}

extension LikedTableViewCell {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 54),
            photoImageView.heightAnchor.constraint(equalToConstant: 54),
            
            labelStackView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 15),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            labelStackView.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor),
        ])
    }
}
