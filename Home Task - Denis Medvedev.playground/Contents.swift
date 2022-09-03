import UIKit

struct Mobile: Hashable {
    var imei: String
    var model:  String
}

class MobileStorage {
    
    enum StorageError:Error {
        case saveError
        case deleteError
    }
    private var storage = Set<Mobile>()
    
    func getAll() -> Set<Mobile> {
        return storage
    }
    
    func findMyImei(_ imei: String) -> Mobile? {
        let array = Array(storage)
        return array.filter {$0.imei == imei}.first
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        let result = storage.insert(mobile)
        return result.memberAfterInsert
        }
        func delete(_ product: Mobile) throws {
            storage.remove(product)
        }
        
        func exists(_ product: Mobile) -> Bool {
            return storage.contains(product)
        }
}
