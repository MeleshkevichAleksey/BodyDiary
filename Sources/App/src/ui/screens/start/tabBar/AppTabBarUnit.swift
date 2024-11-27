import SwiftUI

enum AppTabBarUnit: Int, Identifiable, CaseIterable {
    
    var id: Int {
        rawValue
    }
    
    case notes
    
    case settings
    
    init?(id: Int) {
        self.init(rawValue: id)
    }
}
