//
//  OrderCollectionView.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 27.11.2023.
//

import UIKit

protocol OrderTableProtocol: AnyObject {
    func getTableSettings(itemCount: Int, itemHeight: CGFloat, spacingBetweenItems: CGFloat)
}

class OrderTableView: UITableView {
    
    weak var orderTableDelegate: OrderTableProtocol?
    private let idCell = "idCell"
    private var orders = [OrderModel]()
    
    private var itemCount: Int = 1
    private var itemHeight: Float = 94
    private var spacingBetweenItems: Float?
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(OrderTableViewCell.self, forCellReuseIdentifier: idCell)
        //orderTableDelegate?.getTableSettings(itemCount: itemCount, itemHeight: CGFloat(itemHeight), spacingBetweenItems: <#T##CGFloat#>)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates(){
        dataSource = self
        delegate = self
    }
    
    public func setOrdersToTable(model: [OrderModel]){
        orders = model
    }
    
}

//MARK: - EXTENSIONS
extension OrderTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as? OrderTableViewCell
        else { return UITableViewCell() }
        cell.configure(model: orders[indexPath.row])
        return cell
    }
}

extension OrderTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(itemHeight)
    }
}
