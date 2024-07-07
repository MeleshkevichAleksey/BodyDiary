import SwiftData

public class StorageService {
    
    public static func getCurrentSchema() -> Schema {
        Schema([
            DailyRecordEntity.self,
            UserEntity.self
        ])
    }
}
