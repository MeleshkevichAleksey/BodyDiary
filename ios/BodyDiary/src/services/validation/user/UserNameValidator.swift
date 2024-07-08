import Foundation

class UserNameValidator {
    
    static func validate(_ name: String) -> Bool {
        guard !name.isEmpty else {
            return false
        }
        
        guard name.count > 2 else {
            return false
        }
        
        return true
    }
}
