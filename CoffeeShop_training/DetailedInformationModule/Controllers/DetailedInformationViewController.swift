//
//  DetailedInformationViewController.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 14.11.2023.
//

import UIKit

class DetailedInformationViewController: UIViewController {
    
//MARK: - HEADER
    private let headerLabel = HeaderLabel(text: "Detail")
    private let backArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow-left")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let likedImageView: UIImageView = {
        let like = UIImageView()
        like.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
        like.translatesAutoresizingMaskIntoConstraints = false
        return like
    }()
    
    private var headerStackView = UIStackView()
   
//MARK: - MAIN INFORMATION
    private let photoImageView: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "cappucino1")
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    private let nameLabel = CustomLabel(font: .soraSemiBold20()!, textColor: .specialBlack, text: "Cappucino")
    private let configurationProductLabel = CustomLabel(font: .soraRegular12()!, textColor: .specialGrey, text: "with Chocolate")
    private var nameStackView = UIStackView()
    
    private let starImageView: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(named: "star")
        star.heightAnchor.constraint(equalToConstant: 20).isActive = true
        star.widthAnchor.constraint(equalToConstant: 20).isActive = true
        star.translatesAutoresizingMaskIntoConstraints = false
        return star
    }()
    private let ratingLabel = CustomLabel(font: .soraSemiBold16()!, textColor: .specialBlack, text: "4.8")
    private let rateNumsLabel = CustomLabel(font: .soraRegular12()!, textColor: .specialGrey, text: "(230)")
    private var ratingStackView = UIStackView()
    
    private let beanButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .specialBackground
        btn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        btn.layer.cornerRadius = 14
        btn.setImage(UIImage(named: "bean"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let milkButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .specialBackground
        btn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        btn.layer.cornerRadius = 14
        btn.setImage(UIImage(named: "milk"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private var buttonsStackView = UIStackView()
    
    private let separatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = .specialGrey
        separator.layer.opacity = 0.3
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
//MARK: - DESCRIPTION
    private let descriptionHeaderLabel = CustomLabel(font: .soraSemiBold16()!, textColor: .specialBlack, text: "Description")
    private let descriptionLabel = CustomLabel(font: .soraRegular14()!, textColor: .specialGrey, text: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More")
    
//MARK: - SIZE
    private let sizeHeaderLabel = CustomLabel(font: .soraSemiBold16()!, textColor: .specialBlack, text: "Size")
    private let sizeCollectionView = SizeCollectionView()
    
//MARK: - PRICE
    private let priceLabel = CustomLabel(font: .soraRegular14()!, textColor: .specialGrey, text: "Price")
    private let totalPriceLabel = CustomLabel(font: .soraSemiBold18()!, textColor: .specialOrange, text: "$ 4.53")
    private var priceStackView = UIStackView()
    private let buyButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .specialOrange
        btn.layer.cornerRadius = 16
        btn.setAttributedTitle(NSAttributedString(
            string: "Buy Now",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.white]),
                               for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
        setConstraints()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        
        headerStackView = UIStackView(arrangedSubviews: [backArrowImageView, headerLabel, likedImageView], axis: .horizontal, spacing: 5)
        view.addSubview(headerStackView)
        
        view.addSubview(photoImageView)
        
        nameStackView = UIStackView(arrangedSubviews: [nameLabel, configurationProductLabel], axis: .vertical, spacing: 8)
        view.addSubview(nameStackView)
        
        ratingStackView = UIStackView(arrangedSubviews: [starImageView, ratingLabel, rateNumsLabel], axis: .horizontal, spacing: 4)
        view.addSubview(ratingStackView)
        
        buttonsStackView = UIStackView(arrangedSubviews: [beanButton, milkButton], axis: .horizontal, spacing: 12)
        view.addSubview(buttonsStackView)
        
        view.addSubview(separatorView)
        
        view.addSubview(descriptionHeaderLabel)
        descriptionLabel.numberOfLines = 3
        view.addSubview(descriptionLabel)
        
        view.addSubview(sizeHeaderLabel)
        view.addSubview(sizeCollectionView)
        
        priceStackView = UIStackView(arrangedSubviews: [priceLabel, totalPriceLabel], axis: .vertical, spacing: 8)
        view.addSubview(priceStackView)
        view.addSubview(buyButton)
                
    }
}

extension DetailedInformationViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            photoImageView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 25),
            photoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            photoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            photoImageView.heightAnchor.constraint(equalToConstant: 230),
            
            nameStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20),
            nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            ratingStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 16),
            ratingStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            buttonsStackView.bottomAnchor.constraint(equalTo: ratingStackView.bottomAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            separatorView.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 20),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            descriptionHeaderLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            descriptionHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionHeaderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionHeaderLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            sizeHeaderLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            sizeHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sizeHeaderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            sizeCollectionView.topAnchor.constraint(equalTo: sizeHeaderLabel.bottomAnchor, constant: 12),
            sizeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sizeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            sizeCollectionView.heightAnchor.constraint(equalToConstant: 43),
            
            priceStackView.topAnchor.constraint(equalTo: sizeCollectionView.bottomAnchor, constant: 40),
            priceStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            priceStackView.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -5),
            
            buyButton.centerYAnchor.constraint(equalTo: priceStackView.centerYAnchor),
            buyButton.heightAnchor.constraint(equalToConstant: 62),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buyButton.widthAnchor.constraint(equalToConstant: view.frame.width / 1.7)
        ])
    }
}
