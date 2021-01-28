//  Created by TCode on 28/01/2021.

import Foundation

class UserSession {
    private let userContext = UserContext()

    public var user: User? {
        return userContext.current()
    }
}
