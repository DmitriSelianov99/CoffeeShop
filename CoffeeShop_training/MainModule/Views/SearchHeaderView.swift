//
//  SearchHeaderView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 09.11.2023.
//

import UIKit

class SearchHeaderView: UIView {
    
    private var locationStackView = UIStackView()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .soraRegular12()
        label.textColor = .specialLightGrey
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = "Location"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = .soraSemiBold14()
        label.textColor = .specialLightGrey
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = "Bilzen, Tanjungbalai"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "defaultImage")
        image.layer.cornerRadius = 14
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let searchTextField: UITextField = {
        let searchBar = UITextField()
        searchBar.borderStyle = .none
        searchBar.layer.cornerRadius = 16
        searchBar.textColor = .white
        searchBar.font = .soraRegular14()
        searchBar.backgroundColor = .specialLightBlack
        searchBar.clearButtonMode = .whileEditing
        searchBar.attributedPlaceholder = NSAttributedString(string: "Search coffee",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.specialGrey])
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 52, height: 52))
        let imageView = UIImageView(image: UIImage(named: "search"))
        imageView.frame = CGRect(x: 13, y: 16, width: 20, height: 20)
        containerView.addSubview(imageView)
        
        
        searchBar.leftView = containerView
        searchBar.leftViewMode = .always
        searchBar.returnKeyType = .search
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private let settingButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .specialOrange
        btn.layer.cornerRadius = 12
        btn.setImage(UIImage(named: "setting")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let promoImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "promo")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
        backgroundColor = .specialBlack
        translatesAutoresizingMaskIntoConstraints = false
        
        locationStackView = UIStackView(arrangedSubviews: [locationLabel, cityLabel])
        locationStackView.axis = .vertical
        locationStackView.spacing = 2
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(locationStackView)
        
        addSubview(profileImageView)
        addSubview(searchTextField)
        addSubview(settingButton)
        addSubview(promoImageView)
    }
}

//MARK: - EXTENSIONS
extension SearchHeaderView {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            locationStackView.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            locationStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            locationStackView.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: -10),
            
            profileImageView.centerYAnchor.constraint(equalTo: locationStackView.centerYAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            profileImageView.heightAnchor.constraint(equalToConstant: 44),
            profileImageView.widthAnchor.constraint(equalToConstant: 44),
            
            searchTextField.topAnchor.constraint(equalTo: locationStackView.bottomAnchor, constant: 48),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            searchTextField.heightAnchor.constraint(equalToConstant: 52),
            
            settingButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            settingButton.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -8),
            settingButton.heightAnchor.constraint(equalToConstant: 44),
            settingButton.widthAnchor.constraint(equalToConstant: 44),
            
            promoImageView.centerYAnchor.constraint(equalTo: bottomAnchor),
            promoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
