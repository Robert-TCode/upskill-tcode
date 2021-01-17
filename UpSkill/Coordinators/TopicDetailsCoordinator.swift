//  Created by TCode on 17/01/2021.

import Foundation
import UIKit

class TopicDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    let topic: TopicViewModel

    init(navigationController: UINavigationController, topic: TopicViewModel) {
        self.navigationController = navigationController
        self.topic = topic
    }

    func start() {
        let topicDetailsController = TopicDetailsViewController(topicViewModel: topic)
        topicDetailsController.coordinator = self

        navigationController.pushViewController(topicDetailsController, animated: true)
//        navigationController.present(topicDetailsController, animated: true, completion: nil)
    }
}
