

import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private init(){}
    
    let realm = try! Realm()
    
    func getResultCoffeeModel() -> Results<CoffeeModel> {
        realm.objects(CoffeeModel.self)
    }
    
    func getTappedCoffeeModel(id: Int) -> Results<CoffeeModel> {
        let coffee = realm.objects(CoffeeModel.self)
        let tappedCoffee = coffee.where {
            $0.coffeeId == id
        }
        return tappedCoffee
    }
    
    func likeTappedCoffeeModel(model: CoffeeModel) {
        try! realm.write {
            model.coffeeIsLiked = !model.coffeeIsLiked
        }
    }
    
    func deleteLikeCoffeeModel(model: CoffeeModel){
        try! realm.write {
            model.coffeeIsLiked = false
        }
    }
    
//MARK: - COFFEE TYPE
    func getResultCoffeeTypeModel() -> Results<CoffeeTypeModel> {
        realm.objects(CoffeeTypeModel.self)
    }
    
}
