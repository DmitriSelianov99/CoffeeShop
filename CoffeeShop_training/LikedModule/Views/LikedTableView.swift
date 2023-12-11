//
//  LikedCollectionView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 21.11.2023.
//

import UIKit

protocol LikedTableViewProtocol: AnyObject {
    func deleteLikedCoffee(model: CoffeeModel)
}

class LikedTableView: UITableView {
    
    private var likedArray = [CoffeeModel]()
    weak var likedDelegate: LikedTableViewProtocol?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(LikedTableViewCell.self, forCellReuseIdentifier: LikedTableViewCell.idCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .none
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates(){
        dataSource = self
        delegate = self
    }
    
    public func setArray(array: [CoffeeModel]){
        likedArray = array
    }

}

//MARK: - EXTENSIONS
extension LikedTableView: UITableViewDataSource, UITableViewDelegate {
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        likedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LikedTableViewCell.idCell, for: indexPath) as? LikedTableViewCell
        else { return UITableViewCell() }
        cell.configure(model: likedArray[indexPath.row])
        return cell
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        94
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "") { [weak self] _, _, _ in
            guard let self = self else { return }
            self.likedDelegate?.deleteLikedCoffee(model: likedArray[indexPath.row])
            
        }
        
        action.backgroundColor = .specialBackground
        if let image = UIImage(named: "delete") {
            let newSize = CGSize(width: 40, height: 40)
            let scaleImage = image.resized(to: newSize)
            
            action.image = scaleImage
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
