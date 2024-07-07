import SwiftUI
import SwiftData
import Storage
import BodyDiaryKit
import UserInterface

@main
struct BodyDiaryApp: App {
    
    private let forceDarkMode: Bool
    
    var sharedModelContainer: ModelContainer = {
        let schema = StorageService.getCurrentSchema()
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
        ApplicationConfigurator().setup()
        
        self.forceDarkMode = true
    }

    var body: some Scene {
        WindowGroup {
            StartAppScreen()
                .preferredColorScheme(forceDarkMode ? .dark : .light)
        }
        .modelContainer(sharedModelContainer)
    }
}
