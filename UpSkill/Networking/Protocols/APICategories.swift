//  Created by TCode on 24/01/2021.

import Foundation

protocol APICategories {
    func getTopicCategories(completion: @escaping (Result<[TopicCategory], Error>) -> Void)
}

extension APICategories where Self: APIBase {
    func updatePersistentCategories() {
        do {
            TopicCategoryContext().deleteAllCategories()
            try persistentContainer.viewContext.save()
        } catch {
            fatalError("Failed to save context")
        }
    }
}
