import SwiftData
import FoodNotesKit
import FoodNotesStorage

/**
 Handles user daily notes storing.
 */
@Observable
class NotesRepository {
    
    private var logger: Logger = DependencyContainer.shared.resolve()
    
    private let modelContext: ModelContext
    
    
    private(set) var notes: [NoteEntity]
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        self.notes = []
        
        setupRepository()
    }
    
    private func setupRepository() {
        fetchNotes()
    }
    
    private func fetchNotes() {
        do {
            self.notes = try modelContext.fetch(FetchDescriptor<NoteEntity>())
        }
        catch {
            logger.log(error: error, type: .error)
        }
    }
    
    /**
     Repository stores note.
     */
    func addNote(_ note: NoteEntity) {
        modelContext.insert(note)
        
        fetchNotes()
    }
}
