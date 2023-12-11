//
//  PaymentView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 09.12.2023.
//

import UIKit

class PaymentView: UIView {
    
    private let headerLabel = CustomLabel(font: .soraSemiBold16()!, textColor: .specialBlack, text: "Payment Summary")
    
    private let priceHeaderLabel = CustomLabel(font: .soraRegular14()!, textColor: .specialBlack, text: "Price")
    private let priceLabel = CustomLabel(font: .soraSemiBold14()!, textColor: .specialBlack, text: "$ 4.53")
    private var priceStackView = UIStackView()
    
    private let feeHeaderLabel = CustomLabel(font: .soraRegular14()!, textColor: .specialBlack, text: "Delivery Fee")
    private let feeLabel = CustomLabel(font: .soraSemiBold14()!, textColor: .specialBlack, text: "$ 1.0")
    private var feeStackView = UIStackView()
    
    private let totalPaymentHeaderLabel = CustomLabel(font: .soraRegular14()!, textColor: .specialBlack, text: "Total Payment")
    private let totalPaymentLabel = CustomLabel(font: .soraSemiBold14()!, textColor: .specialBlack, text: "$ 5.53")
    private var totalPaymentStackView = UIStackView()
    
    private let separator = Separator(height: 1)
    
    private var commonStackView = UIStackView()
    
    private let cashImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cash")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let cashView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialSepartor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let orangeCashView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialOrange
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cashLabel = CustomLabel(font: .soraRegular14()!, textColor: .white, text: "Cash")
    private let sumLabel = CustomLabel(font: .soraRegular12()!, textColor: .specialBlack, text: "$ 5.53")
    
    private lazy var moreButton: UIButton = {
        let btn = UIButton()
        btn.setAttributedTitle(NSAttributedString(
            string: "•••",
            attributes: [.foregroundColor : UIColor.white]),
                               for: .normal)
        btn.backgroundColor = .specialGrey
        btn.layer.cornerRadius = 12 //CHANGE TO AUTO SIZING
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
//MARK: - SETTING FUNCS
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
        
        addSubview(headerLabel)
        
        priceStackView = UIStackView(arrangedSubviews: [priceHeaderLabel, priceLabel], axis: .horizontal, spacing: 10)
        feeStackView = UIStackView(arrangedSubviews: [feeHeaderLabel, feeLabel], axis: .horizontal, spacing: 10)
        totalPaymentStackView = UIStackView(arrangedSubviews: [totalPaymentHeaderLabel, totalPaymentLabel], axis: .horizontal, spacing: 10)
        commonStackView = UIStackView(arrangedSubviews: [priceStackView, feeStackView, separator, totalPaymentLabel], axis: .vertical, spacing: 16)
        addSubview(commonStackView)
        
        addSubview(cashImage)
        
        addSubview(cashView)
        addSubview(orangeCashView)
        addSubview(cashLabel)
        addSubview(sumLabel)
        
        addSubview(moreButton)
    }
    
    //MARK: - FUNCTIONS
    public func setTotalPrice(price: Float){
        priceLabel.text = "$ \(price)"
        totalPaymentLabel.text = "$ \(price + 1.0)"
        sumLabel.text = "$ \(price + 1.0)"
    }
}

//MARK: - EXTENSIONS
extension PaymentView {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            commonStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
            commonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            commonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cashImage.topAnchor.constraint(equalTo: commonStackView.bottomAnchor, constant: 16),
            cashImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cashImage.heightAnchor.constraint(equalToConstant: 24),
            cashImage.widthAnchor.constraint(equalToConstant: 24),
            
            orangeCashView.topAnchor.constraint(equalTo: cashView.topAnchor),
            orangeCashView.leadingAnchor.constraint(equalTo: cashView.leadingAnchor),
            orangeCashView.bottomAnchor.constraint(equalTo: cashView.bottomAnchor),
            orangeCashView.trailingAnchor.constraint(equalTo: cashView.centerXAnchor),
            
            cashLabel.centerXAnchor.constraint(equalTo: orangeCashView.centerXAnchor),
            cashLabel.centerYAnchor.constraint(equalTo: cashView.centerYAnchor),
            
            sumLabel.centerYAnchor.constraint(equalTo: cashView.centerYAnchor),
            sumLabel.trailingAnchor.constraint(equalTo: cashView.trailingAnchor, constant: -10),
    
            cashView.topAnchor.constraint(equalTo: commonStackView.bottomAnchor, constant: 16),
            cashView.leadingAnchor.constraint(equalTo: cashImage.trailingAnchor, constant: 12),
            cashView.widthAnchor.constraint(equalToConstant: 112),
            cashView.heightAnchor.constraint(equalToConstant: 24),
            
            moreButton.topAnchor.constraint(equalTo: commonStackView.bottomAnchor, constant: 16),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 24),
            moreButton.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
}
