import Combine
import Foundation

/**
 Performs app services setup.
 */
@Observable
class InitializeService {
    
    var isInitialized: Bool
    
    init() {
        self.isInitialized = false
        
        initialize()
    }
    
    func initialize() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.isInitialized = true
        }
    }
}
