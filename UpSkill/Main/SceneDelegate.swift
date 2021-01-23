//  Created by TCode on 24/12/2020.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var coordinator: AppCoordinator?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        registerPersistentContainer()

//        deleteDatabase()

        coordinator = AppCoordinator(window: window!, apiClient: createAPIClient())
        coordinator?.start()
    }

    private func deleteDatabase() {
        let topicContext = TopicContext()
        topicContext.deleteAllTOpics()

        let categoryContext = TopicCategoryContext()
        categoryContext.deleteAllCategories()
    }

    private func registerPersistentContainer() {
        let persistentContainer = getPersistentContainer()
        ServiceRegistry.shared.register(service: persistentContainer, as: PersistentContainer.self)
    }

    private func createAPIClient() -> APIClientProtocol {
        let persistentContainer: PersistentContainer = ServiceRegistry.shared.make(type: PersistentContainer.self)
        let managedObjectContext = persistentContainer.viewContext
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = managedObjectContext

        let apiClient: APIClientProtocol = MockAPIClient()
        return apiClient
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
        return unitTests != nil || xcodeSchemeUnitTests != nil
    }

    private func isRunningUITests() -> Bool {
        let automationTests = ProcessInfo.processInfo.environment["RunningAutomationTests"]
        return automationTests != nil
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }

}
