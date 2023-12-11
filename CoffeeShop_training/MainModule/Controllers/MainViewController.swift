//
//  ViewController.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 09.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private var coffeeArray = [CoffeeModel]()
    private var coffeeTypeArray = [CoffeeTypeModel]()
    
    private let searchHeaderView = SearchHeaderView()
    private let menuBackgroundView: UIView = {
        let background = UIView()
        background.backgroundColor = .specialBackground
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    
    private let categoryCollectionView = CategoryCollectionView()
    private let productsCollectionView = ProductsCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCoffeeTypeArray()
        selectCategory(category: firstRunAppCategory())
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews(){
        view.backgroundColor = .specialBlack
        view.addSubview(menuBackgroundView)
        view.addSubview(searchHeaderView)
        view.addSubview(categoryCollectionView)
        view.addSubview(productsCollectionView)
    }
    
    private func setDelegates(){
        productsCollectionView.productsCollectionViewDelegate = self
        categoryCollectionView.categoryDelegate = self
    }
    
    private func firstRunAppCategory() -> CoffeeTypeModel{
        let array = RealmManager.shared.getResultCoffeeTypeModel()
        let predicatedType = NSPredicate(format: "type = %@", "Cappucino")
        let filteredArray = array.filter(predicatedType)
        
        return filteredArray[0]
    }
    
    private func getCoffeeArray(type: CoffeeTypeModel){
        let array = RealmManager.shared.getResultCoffeeModel()
        let predicateCoffeeType = NSPredicate(format: "coffeeType.type = %@", type.type)
        let filteredArray = array.filter(predicateCoffeeType)
        
        coffeeArray = filteredArray.map { $0 }
    }
    
    private func getCoffeeTypeArray(){
        let array = RealmManager.shared.getResultCoffeeTypeModel()
        coffeeTypeArray = array.map { $0 }
        categoryCollectionView.setCoffeeTypeArray(array: coffeeTypeArray)
    }

}

//MARK: - EXTENSIONS
extension MainViewController: ProductsCollectionViewCellProtocol {
    func addToOrder(model: CoffeeModel) {
        let orderModel = OrderModel()
        orderModel.coffeeId = model.coffeeId
        orderModel.coffeeImage = model.coffeeImage
        orderModel.coffeeType = model.coffeeType
        orderModel.coffeeConfig = model.coffeeConfig
        orderModel.coffeePrice = model.coffeePrice
        RealmManager.shared.addCoffeeToOrder(model: orderModel)
    }
    
    func openDetailedInformation(model: CoffeeModel) {
        let detailedInformation = DetailedInformationViewController()
        detailedInformation.setModel(model: model)
        detailedInformation.modalPresentationStyle = .fullScreen
        present(detailedInformation, animated: true)
    }
    
    
}

extension MainViewController: ProductsCollectionViewProtocol {
    func testFunc() {
        print("testFunc")
    }
}

extension MainViewController: CategoryCollectionViewProtocol {
    func selectCategory(category: CoffeeTypeModel) {
        getCoffeeArray(type: category)
        
        productsCollectionView.setCoffeeArray(array: coffeeArray)
        productsCollectionView.reloadData()
    }
    
    
}

extension MainViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            searchHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchHeaderView.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
            
            menuBackgroundView.topAnchor.constraint(equalTo: searchHeaderView.bottomAnchor),
            menuBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            categoryCollectionView.topAnchor.constraint(equalTo: searchHeaderView.bottomAnchor, constant: 88),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 38),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            productsCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 28),
            productsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            productsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            productsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}

