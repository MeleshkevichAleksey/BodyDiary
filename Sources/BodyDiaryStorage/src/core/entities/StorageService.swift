import SwiftData

public class BodyDiaryStorageService {
    
    public static func getCurrentSchema() -> Schema {
        Schema([
            DailyRecordEntity.self,
            UserEntity.self
        ])
    }
}
