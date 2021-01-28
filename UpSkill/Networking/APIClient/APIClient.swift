//  Created by TCode on 28/12/2020.

import Foundation

//class APIClient: APIClientProtocol {
//
//    let baseURL = "http://myurlstringhere.com/"
//    let persistentContainer: PersistentContainer
//    let decoder = JSONDecoder()
//
//    init(persistentContainer: PersistentContainer = ServiceRegistry.shared.make(type: PersistentContainer.self)) {
//        self.persistentContainer = persistentContainer
//        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = self.persistentContainer.viewContext
//    }
//    
//    func getTopicCategories(completion: @escaping (Result<[TopicCategory], Error>) -> Void) {
//        guard let url = URL(string: "\(baseURL)topic-categories") else {
//            completion(.failure(StringError.badURL("\(baseURL)topic-categories")))
//            return
//        }
//
//        URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
//            if let error = error {
//                completion(.failure(error))
//            }
//            if let data = data {
//                do {
//                    let topicCategories = try self.decoder.decode([TopicCategory].self, from: data)
//                    completion(.success(topicCategories))
//
//                    do {
//                        try self.persistentContainer.viewContext.save()
//                    } catch {
//                        fatalError("Failed to save context")
//                    }
//                } catch {
//                    completion(.failure(StringError.parsingFailed(data.prettyPrintedJSONString)))
//                }
//            }
//        }.resume()
//    }
//
//}
