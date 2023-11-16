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
        
        getCoffeeArray()
        getCoffeeTypeArray()
        
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
    }
    
    private func getCoffeeArray(){
        let array = RealmManager.shared.getResultCoffeeModel()
        coffeeArray = array.map { $0 }
        
        productsCollectionView.setCoffeeArray(array: coffeeArray)
    }
    
    private func getCoffeeTypeArray(){
        let array = RealmManager.shared.getResultCoffeeTypeModel()
        coffeeTypeArray = array.map { $0 }
        
        categoryCollectionView.setCoffeeTypeArray(array: coffeeTypeArray)
    }

}

//MARK: - EXTENSIONS
extension MainViewController: ProductsCollectionViewCellProtocol {
    func openDetailedInformation() {
        print("detaildInfo")
        let detailedInformation = DetailedInformationViewController()
        detailedInformation.modalPresentationStyle = .fullScreen
        present(detailedInformation, animated: true)
    }
    
    
}

extension MainViewController: ProductsCollectionViewProtocol {
    func testFunc() {
        print("testFunc")
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

