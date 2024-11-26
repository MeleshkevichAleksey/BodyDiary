import FoodNotesKit

struct AppTabUnitsConfiguration {
    
    let units: [AppTabBarUnit]
    
    let initialTab: AppTabBarUnit
    
    init(tabs: [AppTabBarUnit], initialTab: AppTabBarUnit) {
        guard tabs.contains(initialTab) else {
            AppTerminationHandler.execute(message: "Given tabs [\(tabs)] does not contains initialTab: \(initialTab)")
        }
        
        self.units = tabs
        self.initialTab = initialTab
    }
}
