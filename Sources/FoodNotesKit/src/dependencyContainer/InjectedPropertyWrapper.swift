@propertyWrapper
public struct Inject<T: AnyObject> {
    
    public let wrappedValue: T
    
    public init() {
        wrappedValue = DependencyContainer.shared.resolve()
    }
}
