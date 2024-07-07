import SwiftData

/**
 Daily progress entry.
 */
@Model
public class UserEntity {
    
    public var name: String
    
    public var gender: UserGender
    
    public init(name: String, gender: UserGender) {
        self.name = name
        self.gender = gender
    }
}
