/**
 Provides app config.
 */
class AppConfigurationProvider {
    
    let config: AppConfiguration
    
    init() {
        let tabs = AppTabUnitsConfiguration(tabs: [.diary, .settings], initialTab: .diary)
        
        self.config = AppConfiguration(
            tabs: tabs
        )
    }
}
