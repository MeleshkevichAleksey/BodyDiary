import UIKit

/**
 Performs system-based components configuration.
 */
class AppAppearenceConfigurator {
    
    func configure() {
        configureTabBar()
    }
    
    private func configureTabBar() {
        UITabBar.appearance().isHidden = true
    }
}
