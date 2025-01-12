import SwiftUI

/**
 Used as ObservableObject because @Observable cannot be applied to internal property wrappers.
 Should be used with old approach
 */
class UserService: ObservableObject {
    
    private static let isOnboardingCompletedFoodNotesStorageKey: String = "isOnboardingCompleted"
    
    @AppStorage(isOnboardingCompletedFoodNotesStorageKey)
    var isOnboardingCompleted: Bool = false
}
