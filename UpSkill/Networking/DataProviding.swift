//  Created by TCode on 28/12/2020.

import Foundation

protocol DataProviding {
    func getTopicCategories(completion: @escaping (Result<[TopicCategory], Error>) -> Void)
}

enum StringError: Error {
    case parsingFailed
    case fileNotFound
    case badURL

    public var errorDescription: String? {
        switch self {
        case .parsingFailed:
            return "Parsing Failed"
        case .fileNotFound:
            return "File Not Found"
        case .badURL:
            return "Bad URL"
        }
    }
}
