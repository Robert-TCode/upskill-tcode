//  Created by TCode on 28/01/2021.

import Foundation
import CoreData

protocol UserQueryable {
    func current() -> User?
    func deleteUser()
}

class UserContext: NSObject, Context, UserQueryable {
    internal let persistenceContainer: PersistentContainer
    private var fetchRequest: NSFetchRequest<User>
    internal let entityName = "User"

    init(persistenceContainer: PersistentContainer = ServiceRegistry.shared.make(type: PersistentContainer.self)) {
        self.persistenceContainer = persistenceContainer
        fetchRequest = NSFetchRequest(entityName: entityName)
    }

    func current() -> User? {
        fetchRequest.predicate = nil

        do {
            let result = try persistenceContainer.viewContext.fetch(fetchRequest)
            return result.first
        } catch {
            return nil
        }
    }

    func deleteUser() {
        deleteObjectsInContext()
    }
}
