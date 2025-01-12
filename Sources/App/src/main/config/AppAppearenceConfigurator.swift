import SwiftUI
import UIKit
import FoodNotesKit
import FoodNotesUI

/**
 Performs system-based components configuration.
 */
class AppAppearenceConfigurator {
    
    @Inject
    private var uiService: UIService
    
    func configure() {
        configureTabBar()
        configureNavigationBar()
    }
    
    private func configureTabBar() {
        UITabBar.appearance().isHidden = true
    }
    
    private func configureNavigationBar() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiService.colors.textMain.uiColor]
    }
}
