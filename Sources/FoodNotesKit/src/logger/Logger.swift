// TODO: Rework from console logging, add layout for message
public class Logger {
    
    public init() {}
    
    public func log(message: String, type: LoggerMessageType) {
        print()
        print("\(type.rawValue):\n")
        print(message)
        print()
    }
    
    public func log(error: Error, type: LoggerMessageType) {
        print()
        print("\(type.rawValue):\n")
        
        if let exception = error as? Exception {
            print(exception.description)
        }
        else {
            print(error)
        }
        
        print()
    }
    
    public func log(exception: Exception, type: LoggerMessageType) {
        print()
        print("\(type.rawValue):\n")
        print(exception.description)
        print()
    }
}
