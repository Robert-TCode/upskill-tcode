//  Created by TCode on 22/01/2021.

import Foundation
import CoreData

protocol TopicQueryable {
    func fetchTopic(identifier: String) -> Topic?
    func fetchAllTopics() -> [Topic]
    func deleteAllTOpics()
}

class TopicContext: NSObject, TopicQueryable {
    private let persistenceContainer: PersistentContainer
    private var fetchRequest: NSFetchRequest<Topic>

    init(persistenceContainer: PersistentContainer = ServiceRegistry.shared.make(type: PersistentContainer.self)) {
        self.persistenceContainer = persistenceContainer
        fetchRequest = NSFetchRequest(entityName: "Topic")
    }

    func fetchTopic(identifier: String) -> Topic? {
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

    func fetchAllTopics() -> [Topic] {
        fetchRequest.predicate = nil

        do {
            let result = try persistenceContainer.viewContext.fetch(fetchRequest)
            return result
        } catch {
            return []
        }
    }

    func deleteAllTOpics() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Topic")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try persistenceContainer.viewContext.execute(deleteRequest)
        } catch let error {
            print(error)
        }
    }
}
