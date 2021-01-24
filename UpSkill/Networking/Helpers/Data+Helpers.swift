//  Created by TCode on 23/01/2021.

import Foundation

public extension Data {
    var prettyPrintedJSONString: String {
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]) else {
            return "Failed to serialise data in JSON"
        }

        let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) ?? "Failed to convert JSON in String"
        return prettyPrintedString as String
    }
}
