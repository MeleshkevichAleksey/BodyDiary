import SwiftUI
import UIKit
import BodyDiaryKit
import UserInterface

/**
 Performs system-based components configuration.
 */
class AppAppearenceConfigurator {
    
    @Inject
    private var interfaceService: UserInterfaceService
    
    func configure() {
        configureTabBar()
        configureNavigationBar()
    }
    
    private func configureTabBar() {
        UITabBar.appearance().isHidden = true
    }
    
    private func configureNavigationBar() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: interfaceService.colors.textMain.uiColor]
    }
}
