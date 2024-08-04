import BodyDiaryKit
import UserInterface

/**
 Performs application configuration:
 
 - Modules setup
 */
class AppConfigurator {
    
    /**
     Performs configuration.
     */
    func setup() {
        setupKit()
        AppAppearenceConfigurator().configure()
    }
    
    private func setupKit() {
        let services = ServicesFactory.createServices()
        DependencyManager.register(dependencies: services)
    }
}
