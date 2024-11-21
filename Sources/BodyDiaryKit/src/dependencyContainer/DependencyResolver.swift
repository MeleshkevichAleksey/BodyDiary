/**
 Resolves inmemory application instances.
 */
public class DependencyResolver {
    
    private var dependencies: [String: AnyObject]
    
    public static let shared = DependencyResolver()
    
    private init() {
        self.dependencies = [:]
    }

    public func add<T: AnyObject>(_ instance: T) {
        let key = String(reflecting: instance)
        dependencies[key] = instance
    }

    public func resolve<T: AnyObject>() -> T {
        let key = String(reflecting: T.self)
        
        guard let injectable = dependencies[key] as? T else {
            fatalError("\(key) has not been added as an injectable object.")
        }
        
        return injectable
    }
}
