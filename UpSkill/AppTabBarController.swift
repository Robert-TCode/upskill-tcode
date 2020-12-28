//
//  AppTabBarController.swift
//  UpSkill
//
//  Created by TCode on 27/12/2020.
//

import UIKit

class AppTabBarController: UITabBarController {

    private var controllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupControllers()

        self.viewControllers = controllers
        self.selectedIndex = 0
    }

    private func setupControllers() {
        let dashboard = DashboardViewController()
        let explore = ExploreTableViewController(dataProvider: MockDataProvider())
        let exploreNavController = UINavigationController(rootViewController: explore)
        exploreNavController.isNavigationBarHidden = true

        controllers.append(dashboard)
        controllers.append(exploreNavController)
    }
}
