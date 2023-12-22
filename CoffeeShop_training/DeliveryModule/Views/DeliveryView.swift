//
//  DeliveryView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 14.12.2023.
//

import UIKit

class DeliveryView: UIView {

//MARK: - ELEMENTS
    private let handleView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialSepartor
        view.layer.cornerRadius = 2.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLabel = CustomLabel(font: .soraSemiBold16()!, textColor: .specialBlack, text: "10 minutes left")
    
    
    private let timePartsView1: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightGreen
        view.layer.cornerRadius = 2
        view.widthAnchor.constraint(equalToConstant: 65).isActive = true
        view.heightAnchor.constraint(equalToConstant: 4).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timePartsView2: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightGreen
        view.layer.cornerRadius = 2
        view.widthAnchor.constraint(equalToConstant: 65).isActive = true
        view.heightAnchor.constraint(equalToConstant: 4).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timePartsView3: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightGreen
        view.layer.cornerRadius = 2
        view.widthAnchor.constraint(equalToConstant: 65).isActive = true
        view.heightAnchor.constraint(equalToConstant: 4).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timePartsView4: UIView = {
        let view = UIView()
        view.backgroundColor = .specialSepartor
        view.layer.cornerRadius = 2
        view.widthAnchor.constraint(equalToConstant: 65).isActive = true
        view.heightAnchor.constraint(equalToConstant: 4).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var timePartsStackView = UIStackView()
    
    //MARK: NOTATION VIEW
    private let notationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.specialSepartor.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconBorder: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.specialSepartor.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deliveryIconImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "delivery")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let deliveryHeader = CustomLabel(font: .soraSemiBold14()!, textColor: .specialBlack, text: "Delivered your order")
    private let deliveryDescription = CustomLabel(font: .soraRegular12()!, textColor: .specialBlack, text: "We deliver your goods to you in the shortes possible time.")
    private var deliveryLabelsStackView = UIStackView()
    
    private let deliverymanImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "deliveryman")
        image.layer.cornerRadius = 14
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let deliverymanNameLabel = CustomLabel(font: .soraSemiBold14()!, textColor: .specialBlack, text: "Johan Hawn")
    private let deliverymanLabel = CustomLabel(font: .soraRegular14()!, textColor: .specialUnselectedItem, text: "Personal Courier")
    private var deliverymanStackView = UIStackView()
    private lazy var callButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .none
        btn.layer.borderColor = UIColor.specialSepartor.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 14
        btn.setImage(UIImage(named: "call"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
//MARK: - CONFIG FUNCS
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
        backgroundColor = .white
        layer.cornerRadius = 24
        
        addSubview(handleView)
        addSubview(timeLabel)
        
        timePartsStackView = UIStackView(arrangedSubviews: [timePartsView1, timePartsView2, timePartsView3, timePartsView4], axis: .horizontal, spacing: 20)
        addSubview(timePartsStackView)
        
        addSubview(notationView)
        notationView.addSubview(iconBorder)
        notationView.addSubview(deliveryIconImageView)
        
        deliveryDescription.numberOfLines = 2
        deliveryLabelsStackView = UIStackView(arrangedSubviews: [deliveryHeader, deliveryDescription], axis: .vertical, spacing: 8)
        notationView.addSubview(deliveryLabelsStackView)
        
        addSubview(deliverymanImageView)
        deliverymanStackView = UIStackView(arrangedSubviews: [deliverymanNameLabel, deliverymanLabel], axis: .vertical, spacing: 4)
        addSubview(deliverymanStackView)
        addSubview(callButton)
    }
}

//MARK: - EXTENSIONS
extension DeliveryView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            handleView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            handleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            handleView.heightAnchor.constraint(equalToConstant: 5),
            handleView.widthAnchor.constraint(equalToConstant: 44),
            
            timeLabel.topAnchor.constraint(equalTo: handleView.bottomAnchor, constant: 16),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            timePartsStackView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20),
            timePartsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            timePartsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            timePartsStackView.heightAnchor.constraint(equalToConstant: 4),
            
            notationView.topAnchor.constraint(equalTo: timePartsStackView.bottomAnchor, constant: 12),
            notationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            notationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            notationView.heightAnchor.constraint(equalToConstant: 90),
            
            iconBorder.topAnchor.constraint(equalTo: notationView.topAnchor, constant: 14),
            iconBorder.leadingAnchor.constraint(equalTo: notationView.leadingAnchor, constant: 16),
            iconBorder.heightAnchor.constraint(equalToConstant: 62),
            iconBorder.widthAnchor.constraint(equalToConstant: 62),
            
            deliveryIconImageView.heightAnchor.constraint(equalToConstant: 32),
            deliveryIconImageView.widthAnchor.constraint(equalToConstant: 32),
            deliveryIconImageView.centerXAnchor.constraint(equalTo: iconBorder.centerXAnchor),
            deliveryIconImageView.centerYAnchor.constraint(equalTo: iconBorder.centerYAnchor),
            
            deliveryLabelsStackView.topAnchor.constraint(equalTo: iconBorder.topAnchor),
            deliveryLabelsStackView.bottomAnchor.constraint(equalTo: iconBorder.bottomAnchor),
            deliveryLabelsStackView.leadingAnchor.constraint(equalTo: iconBorder.trailingAnchor, constant: 12),
            deliveryLabelsStackView.trailingAnchor.constraint(equalTo: notationView.trailingAnchor, constant: -16),
            
            deliverymanImageView.topAnchor.constraint(equalTo: notationView.bottomAnchor, constant: 20),
            deliverymanImageView.widthAnchor.constraint(equalToConstant: 54),
            deliverymanImageView.heightAnchor.constraint(equalToConstant: 54),
            deliverymanImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            deliverymanStackView.leadingAnchor.constraint(equalTo: deliverymanImageView.trailingAnchor, constant: 10),
            deliverymanStackView.centerYAnchor.constraint(equalTo: deliverymanImageView.centerYAnchor),
            
            callButton.topAnchor.constraint(equalTo: deliverymanImageView.topAnchor),
            callButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            callButton.widthAnchor.constraint(equalToConstant: 54),
            callButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}
