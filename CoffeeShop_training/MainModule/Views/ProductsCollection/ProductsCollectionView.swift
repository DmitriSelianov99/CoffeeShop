//
//  ProductsCollectionView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 10.11.2023.
//

import UIKit

protocol ProductsCollectionViewProtocol: AnyObject {
    func testFunc()
}

class ProductsCollectionView: UICollectionView {
    
    weak var productsCollectionViewDelegate: ProductsCollectionViewProtocol?
    
    private let collectionLayout = UICollectionViewFlowLayout()
    private let idCollection = "idCollection"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        configure()
        setLayouts()
        setDelegates()
        register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: idCollection)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .none
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setLayouts(){
        collectionLayout.scrollDirection = .vertical
        collectionLayout.minimumInteritemSpacing = 20
    }
    
    private func setDelegates(){
        delegate = self
        dataSource = self
    }
}

extension ProductsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCollection, for: indexPath) as? ProductsCollectionViewCell
        else { return UICollectionViewCell() }
        cell.productsCollectionViewCellDelegate = productsCollectionViewDelegate as? ProductsCollectionViewCellProtocol
        return cell
    }
    
    
}

extension ProductsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ProductsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 149, height: collectionView.frame.height / 1.5)
    }
}
