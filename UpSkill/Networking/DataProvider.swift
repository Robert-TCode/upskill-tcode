//
//  DataProvider.swift
//  UpSkill
//
//  Created by TCode on 28/12/2020.
//
import Foundation

protocol DataProviding {
    func getTopicCategories(completion: @escaping ([TopicCategory]) -> Void)
}

class MockDataProvider: DataProviding {

    // Make this a service locator later

    func getTopicCategories(completion: @escaping ([TopicCategory]) -> Void) {
        do {
            guard let localData = self.readLocalFile(name: "topics") else {
                print("Failed to get the local file for topics")
                return
            }
            let topicCategories = try JSONDecoder().decode([TopicCategory].self, from: localData)
            completion(topicCategories)
        } catch {
            print("Failed to parse [TopicCategory]")
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
