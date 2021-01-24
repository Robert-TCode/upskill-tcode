//  Created by TCode on 24/01/2021.

import Foundation

enum StringError: Error {
    case parsingFailed(String)
    case fileNotFound(String)
    case badURL(String)

    public var errorDescription: String? {
        switch self {
        case .parsingFailed(let json):
            return "Parsing Failed. JSON: \(json)"
        case .fileNotFound(let name):
            return "File Not Found. File name: \(name)"
        case .badURL(let urlString):
            return "Bad URL. Value: \(urlString)"
        }
    }
}
