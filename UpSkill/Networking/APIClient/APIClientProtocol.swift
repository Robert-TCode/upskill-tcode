//  Created by TCode on 28/12/2020.

import Foundation

protocol APIClientProtocol {
    func getTopicCategories(completion: @escaping (Result<[TopicCategory], Error>) -> Void)
    var decoder: JSONDecoder { get }
    var persistentContainer: PersistentContainer { get }
}

extension APIClientProtocol {
    func updatePersistentContent() {
        do {
            TopicCategoryContext().deleteAllCategories()
            try persistentContainer.viewContext.save()
        } catch {
            fatalError("Failed to save context")
        }
    }
}

enum StringError: Error {
    case parsingFailed(String)
    case fileNotFound(String)
    case badURL(String)

    public var errorDescription: String? {
        switch self {
        case .parsingFailed(let json):
            return "Parsing Failed. JSON: \(json)"
        case .fileNotFound(let name):
            return "File Not Found. File name: \(name)"
        case .badURL(let urlString):
            return "Bad URL. Value: \(urlString)"
        }
    }
}
