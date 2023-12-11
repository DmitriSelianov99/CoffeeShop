//
//  OrderViewController.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 22.11.2023.
//

import UIKit

class OrderViewController: UIViewController {
    
    var orderTableViewHeightConstraint: NSLayoutConstraint? //for update table height
    private var orderArray = [OrderModel]()
    
//MARK: - ELEMENTS
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let headerLabel = HeaderLabel(text: "Order")
    private let backArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow-left")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Delivery", "Pick Up"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .specialSegmentedGrey
        segmentedControl.selectedSegmentTintColor = .specialOrange
        
        let font = UIFont(name: "Sora-Regular", size: 16)
        segmentedControl.setTitleTextAttributes([.font: UIFont(name: "Sora-Regular", size: 16) as Any, 
                                                .foregroundColor: UIColor.specialBlack], for: .normal)
        segmentedControl.setTitleTextAttributes([.font: UIFont(name: "Sora-SemiBold", size: 16) as Any,
                                                .foregroundColor: UIColor.white], for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentChange), for: .valueChanged)
        segmentedControl.layer.cornerRadius = 10
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let addressView = AddressView()
    private let orderTableView = OrderTableView()
    private let separator = Separator(height: 4)
    
    private let couponView = CouponView()
    private let paymentView = PaymentView()
    
    private lazy var orderButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .specialOrange
        btn.tintColor = .white
        btn.setAttributedTitle(NSAttributedString(string: "Order", attributes: [.font: UIFont.soraSemiBold16()!, .foregroundColor: UIColor.white]), for: .normal)
        btn.layer.cornerRadius = 16
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
//MARK: - CONFIG FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getOrder()
        updateTableViewHeight()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        view.addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        view.addSubview(backArrowImageView)
        view.addSubview(headerLabel)
        view.addSubview(segmentedControl)
        contentView.addSubview(addressView)
        contentView.addSubview(orderTableView)
        contentView.addSubview(separator)
        contentView.addSubview(couponView)
        contentView.addSubview(paymentView)
        view.addSubview(orderButton)
        
        
    }
    
    private func setDelegates(){
        addressView.addressViewDelegate = self
        orderTableView.orderTableDelegate = self
    }
    
//MARK: - FUNCTIONS
    private func calculateCollectionViewHeight() -> CGFloat { //get values from protocol
        let itemCount = orderArray.count
        let itemHeight: CGFloat = 94
        let spacingBetweenItems: CGFloat = 5
        let totalHeight = CGFloat(itemCount) * itemHeight + CGFloat(itemCount - 1) * spacingBetweenItems
        return totalHeight
    }
    
    private func getOrder() {
        let model = RealmManager.shared.getOrderModel()
        var totalPrice: Float = 0
        
        orderArray = model.map { $0 }
        orderTableView.setOrdersToTable(model: orderArray)
        orderTableView.reloadData()
        
        for item in orderArray {
            print(item)
            totalPrice += item.coffeePrice
        }
        print(totalPrice)
        paymentView.setTotalPrice(price: totalPrice)
    }
    
    private func updateTableViewHeight() {
        let newHeight = calculateCollectionViewHeight()
        
        if let constraint = orderTableViewHeightConstraint {
            constraint.constant = newHeight
        } else {
            orderTableViewHeightConstraint = orderTableView.heightAnchor.constraint(equalToConstant: newHeight)
            orderTableViewHeightConstraint?.isActive = true
        }
    }
    
    
//MARK: - objc
    @objc private func segmentChange(){
        print("change")
    }
}

//MARK: - EXTENSIONS
extension OrderViewController: AddressViewProtocol {
    func editButtonTapped() {
        print("edit")
    }
    
    func addNoteButtonTapped() {
        print("note")
    }
}

extension OrderViewController: OrderTableProtocol {
    func getTableSettings(itemCount: Int, itemHeight: CGFloat, spacingBetweenItems: CGFloat) {
        print("111")
    }
}

extension OrderViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 24),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
            contentView.heightAnchor.constraint(equalToConstant: 700),
            
            backArrowImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            backArrowImageView.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            backArrowImageView.heightAnchor.constraint(equalToConstant: 24),
            backArrowImageView.widthAnchor.constraint(equalToConstant: 24),
            
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            segmentedControl.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 25),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            segmentedControl.heightAnchor.constraint(equalToConstant: 44),
            
            addressView.topAnchor.constraint(equalTo: contentView.topAnchor),
            addressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            addressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            addressView.heightAnchor.constraint(equalToConstant: 140),
            
            orderTableView.topAnchor.constraint(equalTo: addressView.bottomAnchor, constant: 0),
            //orderTableView.heightAnchor.constraint(equalToConstant: calculateCollectionViewHeight()),
            orderTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orderTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            separator.topAnchor.constraint(equalTo: orderTableView.bottomAnchor, constant: 0),
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            couponView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 20),
            couponView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            couponView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            couponView.heightAnchor.constraint(equalToConstant: 56),
            
            paymentView.topAnchor.constraint(equalTo: couponView.bottomAnchor, constant: 20),
            paymentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            paymentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            paymentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            orderButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16),
            orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            orderButton.heightAnchor.constraint(equalToConstant: 62),

        ])
    }
}
