import SwiftUI
import FoodNotesStorage
import FoodNotesKit
import Combine

@Observable
class NotesViewModel: Identifiable {
    
    private var userStorage: UserStorageService = DependencyContainer.shared.resolve()
    
    private var notesRepository: NotesRepository = DependencyContainer.shared.resolve()
    
    var selectedNoteDate: Date

    var selectedNote: NoteEntity? {
        didSet(newValue) {
            selectedNoteDate = newValue?.date ?? Date()
        }
    }
    
    var storageCreatedDate: Date
    
    var notes: [NoteEntity] {
        notesRepository.notes.sorted {
            $0.date < $1.date
        }
    }
    
    init() {
        self.selectedNoteDate = Date()
        self.storageCreatedDate = Date()
        
        if let createdDate = userStorage.getUser()?.createdDate {
            self.storageCreatedDate = createdDate
        }
        
        self.selectedNote = getNote(for: selectedNoteDate)
    }
    
    /**
     Handles data selection.
     */
    func selectDate(date: Date) {
        let resolvedNote = getNote(for: date)
        
        selectedNoteDate = date
        selectedNote = resolvedNote
    }
    
    /**
     - returns: Existing one note in repository or creates a new one and store it.
     */
    private func getNote(for date: Date) -> NoteEntity {
        let repositoryNote = notes.first { note in
            Calendar.autoupdatingCurrent.isDate(note.date, equalTo: date, toGranularity: .day)
        }
        
        return repositoryNote ?? addNewNote(date: date)
    }
    
    /**
     Adds new note for given date to repository and return it.
     */
    private func addNewNote(date: Date) -> NoteEntity {
        let newNote = NoteEntity(date: date,
                                 breakfast: MealEntity(),
                                 lunch: MealEntity(),
                                 dinner: MealEntity(),
                                 snacks: [MealEntity(), MealEntity()])
        
        notesRepository.addNote(newNote)
        
        return newNote
    }
}
