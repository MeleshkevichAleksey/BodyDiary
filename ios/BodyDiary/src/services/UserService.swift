import SwiftUI

class UserService: ObservableObject {
    
    private static let isOnboardingCompletedStorageKey: String = "isOnboardingCompleted"
    
    @AppStorage(isOnboardingCompletedStorageKey)
    var isOnboardingCompleted: Bool = false
}
