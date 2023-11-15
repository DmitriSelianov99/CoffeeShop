//
//  CoffeeModel.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 15.11.2023.
//

import Foundation
import RealmSwift

class CoffeeModel: Object {
    @Persisted(primaryKey: true) var coffeeId: ObjectId
    @Persisted var coffeeType: String
    @Persisted var coffeeConfig: String
    @Persisted var coffeePrice: Int
    @Persisted var coffeeRating: Float
    @Persisted var coffeeIsLiked: Bool
}
