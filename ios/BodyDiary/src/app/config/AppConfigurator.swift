import BodyDiaryKit
import UserInterface

/**
 Performs application configuration:
 
 - Modules setup
 */
class AppConfigurator {
    
    private let appearenceConfigurator: AppAppearenceConfigurator
    
    init() {
        self.appearenceConfigurator = AppAppearenceConfigurator()
    }
    
    /**
     Performs configuration.
     */
    func setup() {
        setupKit()
        appearenceConfigurator.configure()
    }
    
    private func setupKit() {
        let services = ServicesFactory.createServices()
        DependencyManager.register(dependencies: services)
    }
}
