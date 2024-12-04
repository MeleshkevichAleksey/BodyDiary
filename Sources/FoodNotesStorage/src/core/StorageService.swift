import SwiftData
import FoodNotesKit

/**
 Service managing app data storage.
 */
public class StorageService {
    
    private var storageModelContainer: ModelContainer
    
    public init() {
        let schema = StorageSchema.getCurrentSchema()
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            self.storageModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        }
        catch {
            AppTerminationHandler.execute(message: "Could not create ModelContainer: \(error)")
        }
    }
    
    /**
     - returns: App data model container.
     */
    public func getModelContainer() -> ModelContainer {
        return storageModelContainer
    }
}
