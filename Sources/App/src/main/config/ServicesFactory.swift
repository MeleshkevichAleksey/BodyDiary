import FoodNotesUI
import FoodNotesKit
import FoodNotesStorage

/**
 App services factory.
 */
@MainActor
class ServicesFactory {
    
    private let storageService: StorageService
    
    init() {
        self.storageService = StorageService()
    }
    
    /**
     Creates core services.
     
     - returns: Services objects array.
     */
    func createCoreServices() -> [AnyObject] {
        let uiService = UIService()
        
        let userService = UserService()
        
        let logger = Logger()
        
        let configurationProvider = AppConfigurationProvider()
        
        let cameraService = CameraService()
        
        let services: [AnyObject] = [
            uiService,
            userService,
            logger,
            configurationProvider,
            storageService,
            cameraService
        ]
        
        return services
    }
    
    /**
     Creates domain-specific services.
     
     - returns: Services objects array.
     */
    func createServices() -> [AnyObject] {
        let userStorageService = UserStorageService(modelContext: storageService.getModelContainer().mainContext)
        
        let noteRepository = NotesRepository(modelContext: storageService.getModelContainer().mainContext)
        
        let services: [AnyObject] = [
            userStorageService,
            noteRepository
        ]
        
        return services
    }
}
