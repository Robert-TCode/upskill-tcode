//  Created by TCode on 23/01/2021.
//

import Foundation
import CoreData

extension TopicCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopicCategory> {
        return NSFetchRequest<TopicCategory>(entityName: "TopicCategory")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var topic: NSSet?

    public var topics: [Topic] {
        let topicsSet = topic as? Set<Topic> ?? []

        return topicsSet.sorted { $0.wrappedTitle < $1.wrappedTitle }
    }
}

// MARK: Generated accessors for topic
extension TopicCategory {

    @objc(addTopicObject:)
    @NSManaged public func addToTopic(_ value: Topic)

    @objc(removeTopicObject:)
    @NSManaged public func removeFromTopic(_ value: Topic)

    @objc(addTopic:)
    @NSManaged public func addToTopic(_ values: NSSet)

    @objc(removeTopic:)
    @NSManaged public func removeFromTopic(_ values: NSSet)

}

extension TopicCategory: Identifiable {

}
