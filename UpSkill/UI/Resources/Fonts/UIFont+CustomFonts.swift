//  Created by TCode on 30/01/2021.

import Foundation
import UIKit

extension UIFont {

    static func custom(style: FontStyle = .regular, size: CGFloat) -> UIFont {
        return UIFont(name: name(for: style), size: size)!
    }

    private static func name(for style: FontStyle) -> String {
        switch style {
        case .regular: return "Metropolis-Regular"
        case .semiBold: return "Metropolis-SemiBold"
        case .bold: return "Metropolis-Bold"
        case .light: return "Metropolis-Light"
        case .medium: return "Metropolis-Medium"
        case .regularItalic: return "Metropolis-RegularItalic"
        }
    }
}

enum FontStyle {
    case light
    case regular
    case regularItalic
    case medium
    case semiBold
    case bold

}
