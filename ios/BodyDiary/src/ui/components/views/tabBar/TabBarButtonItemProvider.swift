class TabBarButtonItemProvider {
    
    /**
     - returns: View data item for given tab.
     */
    func provideItem(for unit: AppTabBarUnit) -> TabBarButtonItem {
        let item: TabBarButtonItem
        
        switch unit {
        case .diary:
            item = TabBarButtonItem(image: "book", title: "TabBar.Diary.Title")
        case .settings:
            item = TabBarButtonItem(image: "gearshape", title: "TabBar.Settings.Title")
        }
        
        return item
    }
}
