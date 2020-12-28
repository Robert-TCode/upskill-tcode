//
//  DataProvider.swift
//  UpSkill
//
//  Created by TCode on 28/12/2020.
//

import Foundation

class DataProvider: DataProviding {
    func getTopicCategories(completion: @escaping (Result<[TopicCategory], Error>) -> Void) {
        guard let url = URL(string: "http://myurlstringhere.com/topic-categories") else {
            return
        }

        URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error while accessing \(url)")
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let topicCategories = try JSONDecoder().decode([TopicCategory].self, from: data)
                    completion(.success(topicCategories))
                } catch {
                    print("Failed to parse [TopicCategory]")
                    completion(.failure(StringError.parsingFailed))
                }
            }
        }.resume()
    }

}
