//
//  OrderModel.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 11.12.2023.
//

import Foundation
import RealmSwift

class OrderModel: Object {
    @Persisted var coffeeId: Int
    @Persisted var coffeeImage: Data?
    @Persisted var coffeeType: CoffeeTypeModel?
    @Persisted var coffeeConfig: String
    @Persisted var coffeePrice: Float
}
