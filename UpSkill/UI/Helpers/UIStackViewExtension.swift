//  Created by TCode on 28/01/2021.

import Foundation
import UIKit

extension UIStackView {

    func addArrangedSubviews(_ views: UIView ...) {
        views.forEach { subview in
            self.addArrangedSubview(subview)
        }
    }
}
