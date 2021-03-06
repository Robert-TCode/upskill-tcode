//  Created by TCode on 03/01/2021.

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
 
    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
