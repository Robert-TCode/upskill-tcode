//  Created by TCode on 22/01/2021.
//

import Foundation
import CoreData

@objc(Topic)
public class Topic: NSManagedObject, Decodable {

    enum CodingKeys: CodingKey {
        case title
        case description
        case difficulty
        case hours
        case expPoints
    }

    required convenience public init(from decoder: Decoder) throws {

        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.topicDescription = try container.decode(String.self, forKey: .description)
        self.difficulty = try container.decode(String.self, forKey: .difficulty)
        self.hours = try container.decode(Int16.self, forKey: .hours)
        self.expPoints = try container.decode(Int16.self, forKey: .expPoints)
    }
}
