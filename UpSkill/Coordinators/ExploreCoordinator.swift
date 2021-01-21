//  Created by TCode on 28/12/2020.

import Foundation
import UIKit

class ExploreCoordinator: Coordinator, ParentCoordinator {
    let databaseProvider: DataProviding

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController, dataProvider: DataProviding) {
        self.databaseProvider = dataProvider
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }

    func start() {
        let exploreTableViewController = ExploreTableViewController(dataProvider: databaseProvider)
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
