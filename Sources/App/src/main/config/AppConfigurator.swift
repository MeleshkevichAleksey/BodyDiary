import FoodNotesKit
import FoodNotesUI

/**
 Performs application configuration:
 
 - Modules setup
 */
@MainActor
class AppConfigurator {
    
    private let servicesFactory: ServicesFactory
    
    init() {
        self.servicesFactory = ServicesFactory()
    }
    
    /**
     Performs configuration.
     */
    func setup() {
        setupKit()
        AppAppearenceConfigurator().configure()
    }
    
    private func setupKit() {
        let coreServices = servicesFactory.createCoreServices()
        DependencyContainer.shared.register(dependencies: coreServices)
        
        let services = servicesFactory.createServices()
        DependencyContainer.shared.register(dependencies: services)
    }
}
