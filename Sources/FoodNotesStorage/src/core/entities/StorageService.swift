import SwiftData

public class StorageService {
    
    public static func getCurrentSchema() -> Schema {
        Schema([
            UserEntity.self
        ])
    }
}
