//  Created by TCode on 27/12/2020.

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    func start()
}
