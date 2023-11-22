//
//  MenuView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 10.11.2023.
//

import UIKit

protocol CategoryCollectionViewProtocol: AnyObject {
    func selectCategory(category: CoffeeTypeModel)
}

class CategoryCollectionView: UICollectionView {
    
    private let collectionLayout = UICollectionViewFlowLayout()
    private let idCollectionCell = "idCollectionCell"
    
    private var coffeeTypeArray = [CoffeeTypeModel]()
    
    weak var categoryDelegate: CategoryCollectionViewProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        configure()
        setLayouts()
        setDelegates()
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: idCollectionCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .none
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setLayouts(){
        collectionLayout.minimumInteritemSpacing = 8
        collectionLayout.scrollDirection = .horizontal
    }
    
    private func setDelegates(){
        delegate = self
        dataSource = self
    }
    
    public func setCoffeeTypeArray(array: [CoffeeTypeModel]){
        coffeeTypeArray = array
    }
}

//MARK: - EXTENSIONS
extension CategoryCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        coffeeTypeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCollectionCell, for: indexPath) as? CategoryCollectionViewCell
        else { return UICollectionViewCell()}
        cell.configure(model: coffeeTypeArray[indexPath.row])
        
        if indexPath.row == 0 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        }
        
        return cell
    }
    
    
}

extension CategoryCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoryDelegate?.selectCategory(category: coffeeTypeArray[indexPath.row])
    }
}

extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
}
