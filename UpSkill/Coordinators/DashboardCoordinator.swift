//  Created by TCode on 28/12/2020.

import Foundation
import UIKit

class DashboardCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }

    func start() {
        let dashboardViewController = DashboardViewController()
        dashboardViewController.coordinator = self
        navigationController.pushViewController(dashboardViewController, animated: false)
    }

    func topicDetails(_ topic: TopicViewModel) {
        let topicDetailsCoordinator = TopicDetailsCoordinator(navigationController: navigationController, topic: topic)
        topicDetailsCoordinator.start()
    }
}
