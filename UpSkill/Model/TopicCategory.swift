//  Created by TCode on 03/01/2021.

import Foundation

struct TopicCategory: Decodable {
    var title: String
    var isUI: Bool
    var topics: [Topic]
}
