//  Created by TCode on 17/01/2021.

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow

    var navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        tabBarCoordinator.start()
    }
}
