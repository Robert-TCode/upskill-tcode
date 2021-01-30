//  Created by TCode on 29/01/2021.

import Foundation
import UIKit

extension UIColor {

    static let primaryBackground = dynamicModeColor(light: simpleColor(red: 1, green: 1, blue: 1),
                                                    dark: simpleColor(red: 1, green: 1, blue: 1))
    static let secondaryBackground = dynamicModeColor(light: simpleColor(red: 1, green: 1, blue: 1),
                                                      dark: simpleColor(red: 1, green: 1, blue: 1))
    static let tertiaryBackground = dynamicModeColor(light: simpleColor(red: 1, green: 1, blue: 1))

    static let primaryText = dynamicModeColor(light: simpleColor(red: 1, green: 1, blue: 1),
                                                    dark: simpleColor(red: 1, green: 1, blue: 1))
    static let secondaryText = dynamicModeColor(light: simpleColor(red: 1, green: 1, blue: 1),
                                                      dark: simpleColor(red: 1, green: 1, blue: 1))
    static let tartiaryText = dynamicModeColor(light: simpleColor(red: 1, green: 1, blue: 1))

}
