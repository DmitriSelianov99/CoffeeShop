

import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private init(){}
    
    let realm = try! Realm()
    
    func getResultCoffeeModel() -> Results<CoffeeModel> {
        realm.objects(CoffeeModel.self)
    }
    
    func getTappedCoffeeModel(id: ObjectId) -> Results<CoffeeModel> {
        let coffee = realm.objects(CoffeeModel.self)
        let tappedCoffee = coffee.where {
            $0.coffeeId == id
        }
        return tappedCoffee
    }
}