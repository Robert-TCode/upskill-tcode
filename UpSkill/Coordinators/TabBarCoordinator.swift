//  Created by TCode on 28/12/2020.

import Foundation
import UIKit

public class TabBarCoordinator: Coordinator, ParentCoordinator {
    let databaseProvider: DataProviding

    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()

    init(navigationController: UINavigationController, databaseProvider: DataProviding) {
        self.navigationController = navigationController
        self.databaseProvider = databaseProvider
    }

    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self

        let dashboardNavigationController = UINavigationController()
        dashboardNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let dashboardCoordinator = DashboardCoordinator(navigationController: dashboardNavigationController)

        let exploreNavigationController = UINavigationController()
        exploreNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        let exploreCoordiantor = ExploreCoordinator(navigationController: exploreNavigationController, dataProvider: databaseProvider)

        tabBarController.viewControllers = [dashboardNavigationController,
                                            exploreNavigationController]

        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: false, completion: nil)

        childCoordinators.append(dashboardCoordinator)
        childCoordinators.append(exploreCoordiantor)
        
        dashboardCoordinator.start()
        exploreCoordiantor.start()
    }
}
