//  Created by TCode on 28/01/2021.

import Foundation
import UIKit

struct UserViewModel {
    private let user: User

    init(user: User) {
        self.user = user
    }
}

extension UserViewModel {
    var fullName: String {
        return "\(user.firstName) \(user.lastName)"
    }

    var expertiseLevel: String {
        return "\(user.level) Engineer"
    }

    var profileImageUrl: String? {
        return user.imageUrl
    }
}
