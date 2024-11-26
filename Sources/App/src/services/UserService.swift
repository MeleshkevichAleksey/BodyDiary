import SwiftUI

class UserService: ObservableObject {
    
    private static let isOnboardingCompletedFoodNotesStorageKey: String = "isOnboardingCompleted"
    
    @AppStorage(isOnboardingCompletedFoodNotesStorageKey)
    var isOnboardingCompleted: Bool = false
}
