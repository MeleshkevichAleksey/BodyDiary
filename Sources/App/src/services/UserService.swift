import SwiftUI

class UserService: ObservableObject {
    
    private static let isOnboardingCompletedBodyDiaryStorageKey: String = "isOnboardingCompleted"
    
    @AppStorage(isOnboardingCompletedBodyDiaryStorageKey)
    var isOnboardingCompleted: Bool = false
}
