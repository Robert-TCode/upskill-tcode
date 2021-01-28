//  Created by TCode on 28/01/2021.
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Decodable {

    enum CodingKeys: CodingKey {
        case firstName
        case lastName
        case level
        case imageUrl
        case experiencePoints
    }

    required convenience public init(from decoder: Decoder) throws {

        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.level = try container.decode(String.self, forKey: .level)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.experiencePoints = try container.decode(Int16.self, forKey: .experiencePoints)
    }
}
