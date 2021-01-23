//  Created by TCode on 22/01/2021.
//

import Foundation
import CoreData

@objc(TopicCategory)
public class TopicCategory: NSManagedObject, Decodable {

    enum CodingKeys: CodingKey {
        case name
        case type
        case topic
    }

    required convenience public init(from decoder: Decoder) throws {

        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.topic = try container.decode(Set<Topic>.self, forKey: .topic) as NSSet
    }
}
