//  Created by TCode on 28/01/2021.

import Foundation
import UIKit

extension NSLayoutConstraint {
    func activate() {
        self.isActive = true
    }

    func deactivate() {
        self.isActive = false
    }
}
