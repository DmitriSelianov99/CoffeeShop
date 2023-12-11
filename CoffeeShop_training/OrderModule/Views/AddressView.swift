//
//  AddressView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 26.11.2023.
//

import UIKit

protocol AddressViewProtocol: AnyObject {
    func editButtonTapped()
    func addNoteButtonTapped()
}

class AddressView: UIView {
    
    weak var addressViewDelegate: AddressViewProtocol?
    
//MARK: - ELEMENTS
    private let headerLabel = CustomLabel(font: .soraSemiBold16()!, textColor: .specialBlack, text: "Delivery Address")
    private let addressLabel = CustomLabel(font: .soraSemiBold14()!, textColor: .specialBlack, text: "JI. Kpg Sutoyo")
    private let fullAddressLabel = CustomLabel(font: .soraRegular12()!, textColor: .specialGrey, text: "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai")
    
    private lazy var editAddressButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 16
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.specialBorder.cgColor
        btn.setAttributedTitle(NSAttributedString(string: "Edit Address",
                                                  attributes: [.font: UIFont.soraRegular12()!,
                                                               .foregroundColor: UIColor.specialBlack]),
                                                    for: .normal)
        btn.titleEdgeInsets = .init(top: 0, left: 4, bottom: 0, right: 0)
        btn.setImage(UIImage(named: "edit")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var addNoteButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 16
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.specialBorder.cgColor
        btn.setAttributedTitle(NSAttributedString(string: "Add Note",
                                                  attributes: [.font: UIFont.soraRegular12()!,
                                                                .foregroundColor: UIColor.specialBlack]),
                                                    for: .normal)
        btn.titleEdgeInsets = .init(top: 0, left: 4, bottom: 0, right: 0)
        btn.setImage(UIImage(named: "note")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(addNoteButtonTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
//    private let separatorView: UIView = {
//        let separator = UIView()
//        separator.backgroundColor = .specialSepartor
//        separator.translatesAutoresizingMaskIntoConstraints = false
//        return separator
//    }()
    
    private let separatorView = Separator(height: 1)
    
//MARK: - CONFIG FUNCTIONS
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(headerLabel)
        addSubview(addressLabel)
        addSubview(fullAddressLabel)
        addSubview(editAddressButton)
        addSubview(addNoteButton)
        addSubview(separatorView)
    }
    
//MARK: - objc
    @objc private func editButtonTapped(){
        addressViewDelegate?.editButtonTapped()
    }
    
    @objc private func addNoteButtonTapped(){
        addressViewDelegate?.addNoteButtonTapped()
    }
}

//MARK: - EXTENSIONS
extension AddressView {
    private func setConsraints(){
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            fullAddressLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 8),
            fullAddressLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullAddressLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            editAddressButton.topAnchor.constraint(equalTo: fullAddressLabel.bottomAnchor, constant: 16),
            editAddressButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            editAddressButton.heightAnchor.constraint(equalToConstant: 27),
            editAddressButton.widthAnchor.constraint(equalToConstant: 120),
            
            addNoteButton.topAnchor.constraint(equalTo: fullAddressLabel.bottomAnchor, constant: 16),
            addNoteButton.leadingAnchor.constraint(equalTo: editAddressButton.trailingAnchor, constant: 8),
            addNoteButton.heightAnchor.constraint(equalToConstant: 27),
            addNoteButton.widthAnchor.constraint(equalToConstant: 100),
            
            separatorView.topAnchor.constraint(equalTo: editAddressButton.bottomAnchor, constant: 20),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            //separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
