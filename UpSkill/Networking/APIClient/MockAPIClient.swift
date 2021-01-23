//  Created by TCode on 28/12/2020.

import Foundation

class MockAPIClient: APIClientProtocol {
    let persistentContainer: PersistentContainer
    let decoder = JSONDecoder()

    init(persistentContainer: PersistentContainer = ServiceRegistry.shared.make(type: PersistentContainer.self)) {
        self.persistentContainer = persistentContainer
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = self.persistentContainer.viewContext
    }

    func getTopicCategories(completion: @escaping (Result<[TopicCategory], Error>) -> Void) {
        guard let localData = self.readLocalFile(name: "topics") else {
            completion(.failure(StringError.fileNotFound("topics")))
            return
        }

        do {
            let topicCategories = try decoder.decode([TopicCategory].self, from: localData)
            completion(.success(topicCategories))

            updatePersistentContent()
        } catch {
            completion(.failure(StringError.parsingFailed(localData.prettyPrintedJSONString)))
        }
    }

    private func readLocalFile(name: String) -> Data? {
        do {
            if let bundleFile = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundleFile).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print("Failed to read local file \(name)")
        }
        return nil
    }
}
