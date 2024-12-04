import SwiftUI
import SwiftData
import FoodNotesStorage
import FoodNotesKit
import FoodNotesUI

@main
struct FoodNotesApp: App {
    
    private let forceDarkMode: Bool
    
    init() {
        AppConfigurator().setup()
        
        self.forceDarkMode = true
    }

    var body: some Scene {
        WindowGroup {
            StartAppScreen()
                .preferredColorScheme(forceDarkMode ? .dark : .light)
        }
        .modelContainer(DependencyContainer.shared.resolve(StorageService.self).getModelContainer())
    }
}
