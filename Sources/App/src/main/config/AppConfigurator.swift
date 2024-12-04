import FoodNotesKit
import FoodNotesUI

/**
 Performs application configuration:
 
 - Modules setup
 */
@MainActor
class AppConfigurator {
    
    /**
     Performs configuration.
     */
    func setup() {
        setupKit()
        AppAppearenceConfigurator().configure()
    }
    
    private func setupKit() {
        let coreServices = ServicesFactory.createCoreServices()
        DependencyContainer.shared.register(dependencies: coreServices)
        
        let services = ServicesFactory.createServices()
        DependencyContainer.shared.register(dependencies: services)
    }
}
