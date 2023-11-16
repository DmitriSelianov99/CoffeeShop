//
//  CoffeeModel.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 15.11.2023.
//

import Foundation
import RealmSwift

class CoffeeModel: Object {
    @Persisted var coffeeId: Int
    @Persisted var coffeeImage: Data?
    @Persisted var coffeeType: CoffeeTypeModel?
    @Persisted var coffeeConfig: String
    @Persisted var coffeePrice: Float
    @Persisted var coffeeRating: Float
    @Persisted var coffeeIsLiked: Bool
}
