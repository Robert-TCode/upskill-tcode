//  Created by TCode on 23/01/2021.

import Foundation
import CoreData

protocol TopicCategoryQueryable {
    func fetchCategory(identifier: String) -> TopicCategory?
    func fetchAllCategories() -> [TopicCategory]
    func deleteAllCategories()
}

class TopicCategoryContext: NSObject, TopicCategoryQueryable {
    private let persistenceContainer: PersistentContainer
    private var fetchRequest: NSFetchRequest<TopicCategory>

    init(persistenceContainer: PersistentContainer = ServiceRegistry.shared.make(type: PersistentContainer.self)) {
        self.persistenceContainer = persistenceContainer
        fetchRequest = NSFetchRequest(entityName: "TopicCategory")
    }

    func fetchAllCategories() -> [TopicCategory] {
        fetchRequest.predicate = nil

        do {
            let result = try persistenceContainer.viewContext.fetch(fetchRequest)
            return result
        } catch {
            return []
        }
    }

    func fetchCategory(identifier: String) -> TopicCategory? {
        fetchRequest.predicate = nil
        let predicate = NSPredicate(format: "identifier == %@", identifier)
        fetchRequest.predicate = predicate

        do {
            let result = try persistenceContainer.viewContext.fetch(fetchRequest)
            return result.first
        } catch {
            return nil
        }
    }

    func deleteAllCategories() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "TopicCategory")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try persistenceContainer.viewContext.execute(deleteRequest)
        } catch let error {
            print(error)
        }
    }
}
