//
//  TopicViewModel.swift
//  UpSkill
//
//  Created by TCode on 03/01/2021.
//

import Foundation
import UIKit

class TopicViewModel {

    private var topic: Topic

    init(topic: Topic) {
        self.topic = topic
    }

    var title: String {
        return topic.title
    }

    var description: String {
        return topic.description
    }

    // Download an image and see if it updates in am uiimageview if it's binded
    var image: Box<UIImage?> = Box(nil)
}
