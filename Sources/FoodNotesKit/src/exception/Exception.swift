import Foundation

/**
 Performs application errors handling with conforming to Error protocol. Can include source error
 */
public class Exception: Error {
    
    public let message: String
    
    public let cause: Error?
    
    public init(message: String) {
        self.message = message
        self.cause = nil
    }
    
    public init(message: String? = nil, cause: Error) {
        if let message {
            self.message = message
        }
        else {
            self.message = "App exception occured by underlying error"
        }
        
        self.cause = cause
    }
    
    /**
     Suitable for logging description of message and its underlying errors.
     */
    var description: String {
        return "\(message) \n \(String(describing: cause?.localizedDescription))"
    }
}
