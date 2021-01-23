//  Created by TCode on 23/01/2021.

import Foundation

class ServiceRegistry {

    public static let shared = ServiceRegistry()

    private init() { }

    private let cache = ServiceCache()

    public func register<Service>(service: Service, as type: Service.Type) {
        cache.store(service, for: type)
    }

    // Services shouldn't be used if not registered.
    // The app will crash below if a service is not registered before being used.
    public func make<Service>(type: Service.Type) -> Service {
        return cache.resolve(for: type)!
    }
}

class ServiceCache {
    @Atomic private var services: [String: Any] = [:]

    func store<Service>(_ service: Service, for serviceType: Service.Type) {
        services[String(describing: serviceType)] = service
    }

    func resolve<Service>(for serviceType: Service.Type) -> Service? {
        return services[String(describing: serviceType)] as! Service?
    }
}

@propertyWrapper
public class Atomic<Value> {
    private var value: Value

    private let syncQueue = DispatchQueue(label: "atomic.\(String(describing: Value.self))")

    public var wrappedValue: Value {
        get {
            return syncQueue.sync {
                return value
            }
        }
        set {
            syncQueue.sync {
                self.value = newValue
            }
        }
    }

    public init(wrappedValue: Value) {
        value = wrappedValue
    }
}
