/**
 Manage registering dependencies.
 */
public class DependencyManager {
    
    /**
     - parameters:
        - dependencies: Objects to register as dependencies.
     */
    public static func register(dependencies: [AnyObject]) {
        for dependency in dependencies {
            DependencyResolver.shared.add(dependency)
        }
    }
}
