//
//  CoffeeTypeModel.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 16.11.2023.
//

import Foundation
import RealmSwift

class CoffeeTypeModel: Object {
    @Persisted var type: String
}
