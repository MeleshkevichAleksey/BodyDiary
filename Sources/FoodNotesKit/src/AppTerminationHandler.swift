/**
 App crash strategy in critical cases.
 Performs error logging.
 */
public class AppTerminationHandler {
    
    private static let logger: Logger = Logger()
    
    /**
     App crash strategy in critical cases.
     Performs error logging and terminates the application.
     
     - Parameters:
        - message: The error message to log.
        - function: The name of the function where the error occurred.
        - file: The name of the file where the error occurred.
        - line: The line number in the file where the error occurred.
     */
    public static func execute(message: String,
                               function: StaticString = #function,
                               file: StaticString = #file,
                               line: Int = #line) -> Never {
        let logMessage = "Fatal Error: \(message)\nFunction: \(function)\nFile: \(file)\nLine: \(line)"
        
        logger.log(message: logMessage, type: .error)
        fatalError(logMessage)
    }
    
    /**
     App crash handler with possibility to pass error.
     */
    public static func execute(error: Exception,
                               function: StaticString = #function,
                               file: StaticString = #file,
                               line: Int = #line) -> Never {
        execute(message: error.description, function: function, file: file, line: line)
    }
}
