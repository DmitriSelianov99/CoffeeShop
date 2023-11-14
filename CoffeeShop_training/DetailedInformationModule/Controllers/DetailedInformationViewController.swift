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
        ])
    }
}
