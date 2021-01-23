//  Created by TCode on 23/01/2021.
//

import Foundation
import CoreData

extension Topic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Topic> {
        return NSFetchRequest<Topic>(entityName: "Topic")
    }

    @NSManaged public var title: String?
    @NSManaged public var topicDescription: String?
    @NSManaged public var difficulty: String?
    @NSManaged public var hours: Int16
    @NSManaged public var expPoints: Int16

    public var wrappedTitle: String {
        return title ?? "Unknown title"
    }
}

extension Topic: Identifiable {

}
