import UserInterface
import BodyDiaryKit

/**
 App services factory.
 */
class ServicesFactory {
    
    /**
     Creates services.
     
     - returns: Services objects array.
     */
    static func createServices() -> [AnyObject] {
        let userInterfaceService = UserInterfaceService()
        
        let userService = UserService()
        
        let logger = Logger()
        
        let configurationProvider = AppConfigurationProvider()
        
        let services: [AnyObject] = [
            userInterfaceService,
            userService,
            logger,
            configurationProvider
        ]
        
        return services
    }
}
