//  Created by TCode on 17/01/2021.

import Foundation

protocol ParentCoordinator: class {
    var childCoordinators: [Coordinator] { get set }
    func didFinishChild(_ child: Coordinator)
}

extension ParentCoordinator {
    func didFinishChild(_ child: Coordinator) {

        for item in childCoordinators.enumerated() where item.element === child {
            childCoordinators.remove(at: item.offset)
            break
        }
    }
}
