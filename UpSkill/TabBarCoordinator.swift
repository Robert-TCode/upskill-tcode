//
//  TabBarCoordinator.swift
//  UpSkill
//
//  Created by TCode on 28/12/2020.
//

import Foundation
import UIKit

class AppTabBarCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    var tabController: UITabBarController

    var navigationController: UINavigationController

    init(tabController: UITabBarController) {
        self.tabController = tabController

        // make navigationController somehow optional here
        self.navigationController = UINavigationController()
    }

    func start() {
        let tabBarCoordinator = AppTabBarController()
//        tabBarCoordinator.coordinator = self
        navigationController.pushViewController(tabBarCoordinator, animated: false)
    }
}
