//  Created by TCode on 03/01/2021.

import Foundation
import UIKit

class TopicViewModel {

    private var topic: Topic

    init(topic: Topic) {
        self.topic = topic
    }

    var title: String {
        return topic.title ?? ""
    }

    var description: String {
        return topic.description
    }

    var image: Box<UIImage?> = Box(nil)
}
