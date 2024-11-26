import FoodNotesUI
import FoodNotesKit

/**
 App services factory.
 */
class ServicesFactory {
    
    /**
     Creates services.
     
     - returns: Services objects array.
     */
    static func createServices() -> [AnyObject] {
        let FoodNotesUIService = FoodNotesUIService()
        
        let userService = UserService()
        
        let logger = Logger()
        
        let configurationProvider = AppConfigurationProvider()
        
        let services: [AnyObject] = [
            FoodNotesUIService,
            userService,
            logger,
            configurationProvider
        ]
        
        return services
    }
}
