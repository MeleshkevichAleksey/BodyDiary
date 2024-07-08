import Foundation
import Storage

class UserValidator {
    
    static func validate(_ user: UserEntity) -> Bool {
        guard UserNameValidator.validate(user.name) else {
            return false
        }
        
        return true
    }
}
