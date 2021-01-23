//  Created by TCode on 17/01/2021.

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    let apiClient: APIClientProtocol

    var navigationController: UINavigationController
    
    init(window: UIWindow, apiClient: APIClientProtocol) {
        self.window = window
        self.apiClient = apiClient
        navigationController = UINavigationController()
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController, apiClient: apiClient)
        tabBarCoordinator.start()
    }
}
