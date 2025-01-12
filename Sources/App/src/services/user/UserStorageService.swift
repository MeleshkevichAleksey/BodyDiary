import FoodNotesStorage
import FoodNotesKit
import SwiftData

class UserStorageService {
    
    @Inject
    private var logger: Logger
    
    private let modelContext: ModelContext
    
    private var user: UserEntity?
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        
        fetchUser()
    }
    
    private func fetchUser() {
        do {
            self.user = try modelContext.fetch(FetchDescriptor<UserEntity>()).first
        }
        catch {
            logger.log(error: error, type: .error)
        }
    }
    
    /**
     - returns: User storage object.
     */
    func getUser() -> UserEntity? {
        return user
    }
}
