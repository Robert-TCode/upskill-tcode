//  Created by TCode on 17/01/2021.

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    let databaseProvider: DataProviding

    var navigationController: UINavigationController
    
    init(window: UIWindow, databaseProvider: DataProviding) {
        self.window = window
        self.databaseProvider = databaseProvider
        navigationController = UINavigationController()
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController, databaseProvider: databaseProvider)
        tabBarCoordinator.start()
    }
}
