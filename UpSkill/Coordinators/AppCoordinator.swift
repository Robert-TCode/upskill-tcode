//  Created by TCode on 17/01/2021.

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    let apiClient: APIClientProtocol

    @Service var userSession: UserSession

    var navigationController: UINavigationController
    
    init(window: UIWindow, apiClient: APIClientProtocol) {
        self.window = window
        self.apiClient = apiClient
        navigationController = UINavigationController()
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        getUser()

        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController, apiClient: apiClient)
        tabBarCoordinator.start()
    }

    private func getUser() {
        apiClient.getUser { _ in }
    }
}
