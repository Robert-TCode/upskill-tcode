//  Created by TCode on 28/12/2020.

import Foundation
import UIKit

class ExploreCoordinator: Coordinator, ParentCoordinator {
    let apiClient: APIClientProtocol

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController, apiClient: APIClientProtocol) {
        self.apiClient = apiClient
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }

    func start() {
        let exploreTableViewController = ExploreTableViewController(apiClient: apiClient)
        exploreTableViewController.coordinator = self
        navigationController.pushViewController(exploreTableViewController, animated: false)
    }

    func didSelectTopic(_ topic: Topic) {
        let topicViewModel = TopicViewModel(topic: topic)
        let topicDetailCoordinator = TopicDetailsCoordinator(navigationController: navigationController, topic: topicViewModel)
        topicDetailCoordinator.start()

        childCoordinators.append(topicDetailCoordinator)
        topicDetailCoordinator.parentCoordinator = self
    }
}
