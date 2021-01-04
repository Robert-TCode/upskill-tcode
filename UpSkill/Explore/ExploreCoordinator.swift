//
//  ExploreCoordinator.swift
//  UpSkill
//
//  Created by TCode on 28/12/2020.
//

import Foundation
import UIKit

class ExploreCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    private var databaseProvider: DataProviding = MockDataProvider()

    init(navigationController: UINavigationController) {
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

        let topicDetailsViewController = TopicDetailsViewController(topicViewModel: topicViewModel)
        topicDetailsViewController.coordinator = self
        navigationController.pushViewController(topicDetailsViewController, animated: true)
    }

    func didSelectRefreshTopic() {
        // refresh topic data
    }
}
