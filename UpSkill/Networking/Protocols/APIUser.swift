//  Created by TCode on 28/01/2021.

import Foundation

protocol APIUser {
    func getUser(completion: @escaping (Result<User, Error>) -> Void)
}

extension APIUser where Self: APIBase {
    func updatePersistentUser() {
        do {
            UserContext().deleteUser()
            try persistentContainer.viewContext.save()
        } catch {
            fatalError("Failed to save context")
        }
    }
}
