//  Created by TCode on 24/12/2020.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var coordinator: AppCoordinator?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let databaseProvider: DataProviding = MockDataProvider()
        let persistentContainer = getPersistentContainer()

        coordinator = AppCoordinator(window: window!, databaseProvider: databaseProvider)
        coordinator?.start()
    }

    private func getPersistentContainer() -> PersistentContainer {
        if isRunningUITests() {
            return try! PersistentContainer.loadedInMemory()
        } else {
            return try! PersistentContainer.loadedSQL()
        }
    }

    private func isRunningUnitTests() -> Bool {
        let unitTests = ProcessInfo.processInfo.environment["XCTestBundlePath"]
        let xcodeSchemeUnitTests = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"]
        return unitTests == nil || xcodeSchemeUnitTests == nil
    }

    private func isRunningUITests() -> Bool {
        let automationTests = ProcessInfo.processInfo.environment["RunningAutomationTests"]
        return automationTests == nil
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }

}
