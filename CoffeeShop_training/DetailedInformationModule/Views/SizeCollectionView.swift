//
//  SizeCollectionView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 14.11.2023.
//

import UIKit

class SizeCollectionView: UICollectionView {
    
    private let collectionLayout = UICollectionViewFlowLayout()
    private let idCell = "idCell"
    private let sizeArray = ["S", "M", "L"]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        configure()
        setupLayout()
        setDelegates()
        register(SizeCollectionViewCell.self, forCellWithReuseIdentifier: idCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .none
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout(){
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumInteritemSpacing = 12
    }
    
    private func setDelegates(){
        delegate = self
        dataSource = self
    }
}

extension SizeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as? SizeCollectionViewCell 
        else { return UICollectionViewCell() }
        cell.setSize(size: sizeArray[indexPath.row])
        return cell
    }
}

extension SizeCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension SizeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3.2, height: collectionView.frame.height)
    }
}
