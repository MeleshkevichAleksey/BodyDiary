import BodyDiaryKit
import UserInterface

/**
 Performs application configuration:
 
 - Modules setup
 */
class ApplicationConfigurator {
    
    /**
     Performs configuration.
     */
    func setup() {
        setupKit()
    }
    
    private func setupKit() {
        let services = ServicesFactory.createServices()
        DependencyManager.register(dependencies: services)
    }
}
