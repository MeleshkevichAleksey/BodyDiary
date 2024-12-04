/**
 Resolves inmemory application instances.
 */
public class DependencyContainer {
    
    private var dependencies: [String: AnyObject]
    
    public static let shared = DependencyContainer()
    
    private init() {
        self.dependencies = [:]
    }
    
    /**
     - parameters:
        - dependencies: Objects to register as dependencies.
     */
    public func register(dependencies: [AnyObject]) {
        for dependency in dependencies {
            add(dependency)
        }
    }
    
    public func resolve<T: AnyObject>() -> T {
        let key = String(reflecting: T.self)
        
        guard let injectable = dependencies[key] as? T else {
            fatalError("\(key) has not been added as an injectable object.")
        }
        
        return injectable
    }
    
    public func resolve<T: AnyObject>(_ type: T.Type) -> T {
        let key = String(reflecting: T.self)
        
        guard let injectable = dependencies[key] as? T else {
            fatalError("\(key) has not been added as an injectable object.")
        }
        
        return injectable
    }

    private func add<T: AnyObject>(_ instance: T) {
        let key = String(reflecting: instance)
        dependencies[key] = instance
    }
}
