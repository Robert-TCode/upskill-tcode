//
//  AppTabBarController.swift
//  UpSkill
//
//  Created by TCode on 27/12/2020.
//

import UIKit

class TabBarController: UITabBarController {

//    private var controllers: [UIViewController] = []
    var coordinator: TabBarCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

//        setupControllers()

//        self.viewControllers = controllers
//        self.selectedIndex = 0
    }

//    private func setupControllers() {
//
//        let dashboardNavigationController = UINavigationController()
//        let dashboardCoordinator = DashboardCoordinator(navigationController: dashboardNavigationController)
//        dashboardCoordinator.start()
//
//        let exploreNavigationController = UINavigationController()
//        let exploreCoordinator = ExploreCoordinator(navigationController: exploreNavigationController)
//        exploreCoordinator.start()
//
//        controllers.append(dashboardNavigationController)
//        controllers.append(exploreNavigationController)
//
////        coordinators.append(dashboardCoordinator)
////        coordinators.append(exploreCoordinator)
//    }
}
