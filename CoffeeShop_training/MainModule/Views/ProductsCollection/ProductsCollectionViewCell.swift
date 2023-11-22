//
//  ProductsCollectionViewCell.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 10.11.2023.
//

import UIKit

protocol ProductsCollectionViewCellProtocol: AnyObject {
    func openDetailedInformation(model: CoffeeModel)
}

class ProductsCollectionViewCell: UICollectionViewCell {
    
    weak var productsCollectionViewCellDelegate: ProductsCollectionViewCellProtocol?
    private var coffeeModel = CoffeeModel()
    
    private let ratingBackgroundView: UIView = {
        let background = UIView()

        background.backgroundColor = .black
        background.layer.opacity = 0.16
        background.translatesAutoresizingMaskIntoConstraints = false

        // Установка размеров background
        background.widthAnchor.constraint(equalToConstant: 51).isActive = true
        background.heightAnchor.constraint(equalToConstant: 25).isActive = true

        return background
    }()
    
    private let starImageView: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(named: "star")
        star.heightAnchor.constraint(equalToConstant: 10).isActive = true
        star.widthAnchor.constraint(equalToConstant: 10).isActive = true
        star.translatesAutoresizingMaskIntoConstraints = false
        return star
    }()
    
    private let ratingLabel = CustomLabel(font: .soraSemiBold18()!, textColor: .white, text: "4.9")
    private var ratingStackView = UIStackView()

    override func layoutSubviews() {
        super.layoutSubviews()

        // Определение маски для скругления углов
        let maskPath = UIBezierPath(
            roundedRect: ratingBackgroundView.bounds,
            byRoundingCorners: [.topLeft, .bottomRight],
            cornerRadii: CGSize(width: 16, height: 16)
        )

        // Создание слоя маски и применение его к ratingBackgroundView
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        ratingBackgroundView.layer.mask = maskLayer
    }
    
    
    private let productImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "cappucino")
        
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    private let categoryLabel = CustomLabel(font: .soraSemiBold16()!, textColor: .specialBlack, text: "Cappucino")
    private let configurationProductLabel = CustomLabel(font: .soraRegular12()!, textColor: .specialGrey, text: "with Chocolate")
    private let priceLabel = CustomLabel(font: .soraSemiBold18()!, textColor: .specialGreen, text: "$ 4.53")

    
    private lazy var addButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .specialOrange
        btn.setImage(UIImage(named: "plus"), for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        layer.cornerRadius = 16
        backgroundColor = .white
        
        contentView.addSubview(productImageView)
        addSubview(ratingBackgroundView)
        addSubview(categoryLabel)
        addSubview(configurationProductLabel)
        addSubview(priceLabel)
        contentView.addSubview(addButton)
        
        ratingStackView = UIStackView(arrangedSubviews: [starImageView, ratingLabel], axis: .horizontal, spacing: 2)
        ratingStackView.distribution = .equalCentering
        addSubview(ratingStackView)
    }
    
    public func addGesture(){
        let tapImageView = UITapGestureRecognizer(target: self, action: #selector(getDetailedInformation))
        tapImageView.cancelsTouchesInView = false
        productImageView.isUserInteractionEnabled = true
        productImageView.addGestureRecognizer(tapImageView)
    }
    
    public func configure(model: CoffeeModel){
        coffeeModel = model
        
        ratingLabel.text = "\(model.coffeeRating)"
        
        let typeString = model.coffeeType?.type ?? "Тип не определен"
        categoryLabel.text = typeString
        //categoryLabel.text = "\(model.coffeeType?.type)"
        configurationProductLabel.text = model.coffeeConfig
        priceLabel.text = "$ \(model.coffeePrice)"
        
        guard let imageData = model.coffeeImage, let image = UIImage(data: imageData)
        else { return }
        productImageView.image = image.withRenderingMode(.alwaysOriginal)
    }
    
//MARK: - objc
    @objc private func getDetailedInformation(){
        print("button cell")
        productsCollectionViewCellDelegate?.openDetailedInformation(model: coffeeModel)
    }
}

//MARK: - EXTENSIONS
extension ProductsCollectionViewCell {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            productImageView.heightAnchor.constraint(equalToConstant: 132),
            
            ratingBackgroundView.topAnchor.constraint(equalTo: productImageView.topAnchor),
            ratingBackgroundView.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
//            ratingBackgroundView.widthAnchor.constraint(equalToConstant: 51),
//            ratingBackgroundView.heightAnchor.constraint(equalToConstant: 25),
            
            ratingStackView.centerYAnchor.constraint(equalTo: ratingBackgroundView.centerYAnchor),
            ratingStackView.centerXAnchor.constraint(equalTo: ratingBackgroundView.centerXAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 12),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            configurationProductLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 2),
            configurationProductLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            configurationProductLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            priceLabel.topAnchor.constraint(equalTo: configurationProductLabel.bottomAnchor, constant: 12),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            priceLabel.trailingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: -12),
            
            addButton.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            addButton.heightAnchor.constraint(equalToConstant: 32),
            addButton.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
}
