//  Created by TCode on 28/12/2020.

import Foundation

typealias APIClientProtocol = APIBase & APIUser & APICategories

protocol APIBase {
    var decoder: JSONDecoder { get }
    var persistentContainer: PersistentContainer { get }
}
