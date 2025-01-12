import SwiftData

/**
 Data scheme of storage for each version.
 */
class StorageSchema {
    
    /**
     - returns: Current schema.
     */
    public static func getCurrentSchema() -> Schema {
        Schema([
            UserEntity.self,
            NoteEntity.self,
            MealEntity.self,
            MealEnergyValueEntity.self,
        ])
    }
}
