//
//  LikedViewController.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 21.11.2023.
//

import UIKit

class LikedViewController: UIViewController {
    
    private let headerLabel = HeaderLabel(text: "Liked")
    private let likedTableView = LikedTableView()
    
    private var likedArray = [CoffeeModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getModels()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        
        view.addSubview(headerLabel)
        view.addSubview(likedTableView)
    }
    
    private func getModels(){
        let models = RealmManager.shared.getResultCoffeeModel()
        likedArray = models.map { $0 }.filter { $0.coffeeIsLiked == true }
        
        likedTableView.setArray(array: likedArray)
        likedTableView.reloadData()
    }

    private func setDelegates(){
        likedTableView.likedDelegate = self
    }
    
}

//MARK: - EXTENSIONS
extension LikedViewController: LikedTableViewProtocol {
    func deleteLikedCoffee(model: CoffeeModel) {
        RealmManager.shared.deleteLikeCoffeeModel(model: model)
        //likedArray = likedArray.filter { $0 != model }
        getModels()
        
    }
}


extension LikedViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            likedTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 25),
            likedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            likedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            likedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
