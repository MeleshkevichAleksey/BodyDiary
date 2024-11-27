/**
 Provides app config.
 */
class AppConfigurationProvider {
    
    let config: AppConfiguration
    
    init() {
        let tabs = AppTabUnitsConfiguration(tabs: [.notes, .settings], initialTab: .notes)
        
        self.config = AppConfiguration(
            tabs: tabs
        )
    }
}
