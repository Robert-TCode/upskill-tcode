//  Created by TCode on 28/01/2021.

import Foundation
import UIKit

public enum Edge: CaseIterable {
    case left
    case right
    case top
    case bottom

    static var vertical: [Edge] = [.top, .bottom]
    static var horizontal: [Edge] = [.left, .right]
}

extension UIView {

    func pin(edges: [Edge] = Edge.allCases, to view: UIView, insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        edges.forEach { edge in
            switch edge {
            case .left:
                self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).activate()
            case .right:
                self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).activate()
            case .top:
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).activate()
            case .bottom:
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).activate()
            }
        }
    }

    func addSubviewWithoutConstraints(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
    }

    func constraint(toSize size: CGSize) {
        self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }

    func setCornerRadius(to radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}
