//  Created by TCode on 28/01/2021.

import Foundation
import CoreData

protocol Context {
    var persistenceContainer: PersistentContainer { get }
    var entityName: String { get }
}

extension Context {
    func deleteObjectsInContext() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try persistenceContainer.viewContext.execute(deleteRequest)
        } catch let error {
            print(error)
        }
    }
}
