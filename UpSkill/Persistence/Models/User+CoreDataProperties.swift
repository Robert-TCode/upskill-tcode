//  Created by TCode on 28/01/2021.
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var level: String
    @NSManaged public var imageUrl: String?
    @NSManaged public var experiencePoints: Int16

}

extension User: Identifiable {

}
