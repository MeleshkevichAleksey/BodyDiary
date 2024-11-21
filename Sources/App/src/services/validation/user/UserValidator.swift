import Foundation
import BodyDiaryStorage

class UserValidator {
    
    static func validate(_ user: UserEntity) -> Bool {
        guard UserNameValidator.validate(user.name) else {
            return false
        }
        
        return true
    }
}
