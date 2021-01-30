//  Created by TCode on 29/01/2021.

import Foundation
import UIKit

extension UIColor {
    static func simpleColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
    }

    static func dynamicModeColor(light: UIColor, dark: UIColor? = nil) -> UIColor {
        return  UIColor(dynamicProvider: { (traitCollection) -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark : return dark ?? light
            default: return light
            }
        })
    }
}
