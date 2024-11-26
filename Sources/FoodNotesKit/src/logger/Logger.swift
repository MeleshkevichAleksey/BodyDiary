// TODO: Rework from console logging
public class Logger {
    
    public init() {}
    
    public func log(message: String, type: LoggerMessageType) {
        print()
        print("\(type.rawValue):\n")
        print(message)
        print()
    }
}
