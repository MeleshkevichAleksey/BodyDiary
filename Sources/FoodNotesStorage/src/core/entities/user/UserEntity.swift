import SwiftData
import Foundation

/**
 Daily progress entry.
 */
@Model
public class UserEntity {
    
    @Attribute(.unique)
    public var id: UUID
    
    public var name: String
    
    public var gender: UserGender
    
    public var createdDate: Date
    
    @Attribute(.externalStorage)
    public var avatar: Data?
    
    public init(id: UUID = UUID(),
                name: String,
                gender: UserGender,
                createdDate: Date = .now,
                avatar: Data? = nil) {
        self.id = id
        self.name = name
        self.gender = gender
        self.createdDate = createdDate
        self.avatar = avatar
    }
}
