class TabBarShapeItemProvider {
    
    func provideItem(for unit: AppTabBarUnit) -> TabBarShapeItem {
        let item: TabBarShapeItem
        
        switch unit {
        case .diary:
            item = TabBarShapeItem(image: "book", title: "TabBar.Diary.Title")
        case .settings:
            item = TabBarShapeItem(image: "gearshape", title: "TabBar.Settings.Title")
        }
        
        return item
    }
}
