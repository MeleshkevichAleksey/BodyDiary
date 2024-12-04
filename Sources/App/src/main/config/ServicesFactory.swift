import FoodNotesUI
import FoodNotesKit
import FoodNotesStorage

/**
 App services factory.
 */
@MainActor
class ServicesFactory {
    
    /**
     Creates core services.
     
     - returns: Services objects array.
     */
    static func createCoreServices() -> [AnyObject] {
        let uiService = UIService()
        
        let userService = UserService()
        
        let logger = Logger()
        
        let configurationProvider = AppConfigurationProvider()
        
        let storageService = StorageService()
        
        let services: [AnyObject] = [
            uiService,
            userService,
            logger,
            configurationProvider,
            storageService,
        ]
        
        return services
    }
    
    /**
     Creates domain-specific services.
     
     - returns: Services objects array.
     */
    static func createServices() -> [AnyObject] {
        let userStorageService = UserStorageService()
        
        let services: [AnyObject] = [
            userStorageService,
        ]
        
        return services
    }
}
