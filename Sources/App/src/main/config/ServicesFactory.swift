import BodyDiaryUI
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
        let BodyDiaryUIService = BodyDiaryUIService()
        
        let userService = UserService()
        
        let logger = Logger()
        
        let configurationProvider = AppConfigurationProvider()
        
        let services: [AnyObject] = [
            BodyDiaryUIService,
            userService,
            logger,
            configurationProvider
        ]
        
        return services
    }
}
