import Foundation
import FoodNotesStorage

class UserValidator {
    
    static func validate(_ user: UserEntity) -> Bool {
        guard UserNameValidator.validate(user.name) else {
            return false
        }
        
        return true
    }
}
