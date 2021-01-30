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

func makeStackView(axis: NSLayoutConstraint.Axis = .vertical,
                   alignment: UIStackView.Alignment = .fill,
                   distribution: UIStackView.Distribution = .fill,
                   spacing: CGFloat = 8) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = axis
    stackView.alignment = alignment
    stackView.distribution = distribution
    stackView.spacing = spacing

    return stackView
}
